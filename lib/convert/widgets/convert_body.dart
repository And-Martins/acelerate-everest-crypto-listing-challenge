import 'package:crypto_listing/convert/widgets/dropdown_crypto.dart';
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

class ConvertBody extends StatefulHookConsumerWidget {
  const ConvertBody({Key? key}) : super(key: key);

  @override
  ConsumerState<ConvertBody> createState() => _ConvertBodyState();
}

class _ConvertBodyState extends ConsumerState<ConvertBody> {
  @override
  Widget build(BuildContext context) {
    final cryptoData = ref.watch(listCryptoProvider);
    return Column(
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
                  "${formatCriptoCompleto.format(DecimalIntl(Decimal.parse(ref.watch(criptoQtdWalletCriptoProvider).toString())))} ${ref.watch(fromCryptoConvertAbrev).toUpperCase()}",
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
                fromCrypto: ref.watch(fromCryptoConvertAbrev)),
            const Icon(
              Icons.sync_alt_rounded,
              color: Colors.red,
            ),
            DropdownCrypto(
              cryptoData: cryptoData,
              type: "to",
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            style: GoogleFonts.montserrat(
              fontSize: 35,
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
        const Padding(
          padding: EdgeInsets.only(top: 8.0, right: 310),
          child: DefaultSubtitle(
            'R\$ 0,00',
            strong: 500,
          ),
        ),
       //TODO Substituir esse sizedBox por algo melhor 
        const SizedBox(height: 200),
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
                        '0,0000 ${ref.watch(fromCryptoConvertAbrev).toUpperCase()}',
                        strong: 600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  iconSize: 58,
                  icon: CircleAvatar(
                    backgroundColor: Colors.grey.shade400,
                    radius: 40,
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
