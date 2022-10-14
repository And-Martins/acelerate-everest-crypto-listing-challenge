import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/providers.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';
import '../../shared/widgets/number_formatter.dart';
import '../../wallet/controller/crypto_provider.dart';
import '../controller/providers.dart';
import 'dropdown_crypto.dart';

class ConvertBody extends StatefulHookConsumerWidget {
  const ConvertBody({Key? key}) : super(key: key);

  @override
  ConsumerState<ConvertBody> createState() => _ConvertBodyState();
}

class _ConvertBodyState extends ConsumerState<ConvertBody> {
  @override
  Widget build(BuildContext context) {
    double fromCryptoCotacao = ref.watch(fromCryptoCotacaoProvider);
    TextEditingController formFieldController = TextEditingController();

    const limitReachedMessage = SnackBar(
      backgroundColor: Colors.red,
      content: Text('Quantidade inserida é maior que a quantidade disponível!'),
    );

    final cryptoData = ref.watch(listCryptoProvider);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey.shade200,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DefaultSubtitle('Saldo disponível'),
                  DefaultSubtitle(
                    "${formatCriptoCompleto.format(DecimalIntl(Decimal.parse(ref.watch(cryptoQtdWalletCriptoProvider).toString())))} ${ref.watch(fromCryptoConvertAbrev).toUpperCase()}",
                    strong: 600,
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: DefaultTitle(
              title: "Quanto você gostaria de converter?",
              strong: 700,
              titleSize: 28,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownCrypto(
                cryptoData: cryptoData,
                type: "from",
                fromCrypto: ref.watch(fromCryptoConvertAbrev),
              ),
              const Icon(
                Icons.sync_alt_rounded,
                color: Colors.red,
              ),
              DropdownCrypto(
                cryptoData: cryptoData,
                type: "to",
                fromCrypto: ref.watch(fromCryptoConvertAbrev),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
            child: TextFormField(
              onChanged: (value) {
                ref.watch(transferCryptoConverted.state).state =
                    (double.parse(value) * fromCryptoCotacao);
                ref.watch(fieldTransferValue.state).state = value;
              },
              onFieldSubmitted: (value) {
                if (ref.watch(cryptoQtdWalletCriptoProvider) <
                    double.parse(formFieldController.text.toString())) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(limitReachedMessage);
                } else {
                  ref.watch(resultConvertedValue.state).state =
                      (ref.watch(transferCryptoConverted.state).state /
                          ref.watch(toCryptoCotacaoProvider.state).state);
                }
              },
              controller: formFieldController
                ..text = ref.watch(fieldTransferValue.state).state
                ..selection = TextSelection.collapsed(
                    offset: ref.watch(fieldTransferValue.state).state.length),
              style: GoogleFonts.montserrat(
                fontSize: 30,
                color: const Color.fromRGBO(149, 151, 166, 1),
                fontWeight: FontWeight.w500,
              ),
              keyboardType: TextInputType.number,
              cursorHeight: 35,
              decoration: InputDecoration(
                hintText:
                    "${ref.watch(fromCryptoConvertAbrev).toUpperCase()} 0,00",
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 35,
                  color: const Color.fromRGBO(149, 151, 166, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DefaultSubtitle(
                  'R\$ ${formatReais.format(ref.watch(transferCryptoConverted.state).state)}',
                  strong: 500,
                ),
              ],
            ),
          ),
          const SizedBox(height: 180),
          Column(
            children: [
              Divider(
                color: Colors.grey.shade300,
                thickness: 2.5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: DefaultSubtitle(
                          'Total estimado',
                          strong: 500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DefaultSubtitle(
                          '${ref.watch(resultConvertedValue).toStringAsFixed(8)} ${ref.watch(toCryptoConvertAbrev).toUpperCase()}',
                          strong: 600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
