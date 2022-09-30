import 'package:crypto_listing/wallet/model/crypto_view_data.dart';
import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
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
  ConsumerState<ConvertBody> createState() => _ConvertScreenState();
}

class _ConvertScreenState extends ConsumerState<ConvertBody> {
  // String dropdownValue = listCrypto.cryptoItem.nome.first;
  @override
  Widget build(BuildContext context) {
    final cryptoData = ref.watch(listCryptoProvider);
    List<CryptoViewData> listCrypto = [];

    for (CryptoViewData crypto in cryptoData.value!.cryptoViewDataList) {
      listCrypto.add(crypto);
    }

    CryptoViewData dropdownValue = listCrypto.first;

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
        DropdownButton<CryptoViewData>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          onChanged: (CryptoViewData? cryptoItem) {
            setState(() {
              dropdownValue = cryptoItem!;
            });
          },
          items: listCrypto.map<DropdownMenuItem<CryptoViewData>>(
              (CryptoViewData cryptoItem) {
            return DropdownMenuItem<CryptoViewData>(
              value: cryptoItem,
              child: Row(
                children: [
                  Image.network(
                    cryptoItem.image,
                    scale: 12,
                  ),
                  const SizedBox(width: 4),
                  Text(cryptoItem.symbol.toUpperCase()),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
