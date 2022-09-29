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
                  "${formatCriptoCompleto.format(DecimalIntl(Decimal.parse(ref.watch(criptoQtdWalletCriptoProvider).toString())))} ${ref.watch(criptoAbrevProvider).toUpperCase()}",
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
            },
          ).toList(),
          onChanged: (CryptoViewData? cryptoItemSelected) {
            // setState(() {
            //   cryptoItem = cryptoItemSelected.name;
            // });
            print(cryptoItemSelected!.name);
          },
          // value: cryptoData,
        ),
      ],
    );

    // return cryptoData.when(
    //   data: (data) {
    //     List<CryptoViewData> cryptoList = data.cryptoViewDataList
    //         .where((item) => item.symbol != ref.watch(criptoAbrevProvider))
    //         .toList();
    //     String selectedCrypto = cryptoList[0].symbol.toUpperCase();
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Container(
    //           color: Colors.grey.shade200,
    //           height: 50,
    //           child: Padding(
    //             padding: const EdgeInsets.all(15),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 const DefaultSubtitle('Saldo disponível'),
    //                 DefaultSubtitle(
    //                   "${formatCriptoCompleto.format(DecimalIntl(Decimal.parse(ref.watch(criptoQtdWalletCriptoProvider).toString())))} ${ref.watch(criptoAbrevProvider).toUpperCase()}",
    //                   strong: 600,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //         const Padding(
    //           padding: EdgeInsets.all(20.0),
    //           child: DefaultTitle(
    //             title: "Quanto você gostaria de converter?",
    //             strong: 700,
    //             titleSize: 28,
    //           ),
    //         ),
    //       ],
    //     );
    //   },
    //   error: (error, stackTrace) {
    //     debugPrintStack(stackTrace: stackTrace);
    //     return const Text('Erro');
    //   },
    //   loading: () => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
  }
}
