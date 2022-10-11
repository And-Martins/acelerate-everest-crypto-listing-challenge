import 'package:crypto_listing/convert/widgets/convert_textfield.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                  DefaultSubtitle(AppLocalizations.of(context)!.convertBalance),
                  DefaultSubtitle(
                    "${formatCriptoCompleto.format(DecimalIntl(Decimal.parse(ref.watch(cryptoQtdWalletCriptoProvider).toString())))} ${ref.watch(fromCryptoConvertAbrev).toUpperCase()}",
                    strong: 600,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DefaultTitle(
              title: AppLocalizations.of(context)!.convertText,
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
          const ConvertTextfield(),
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DefaultSubtitle(
                          AppLocalizations.of(context)!.convertTextTotal,
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
