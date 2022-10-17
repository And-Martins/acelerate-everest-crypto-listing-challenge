import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../wallet/model/crypto_list_view_data.dart';
import '../../wallet/model/crypto_view_data.dart';
import '../controller/providers.dart';

class DropdownCrypto extends StatefulHookConsumerWidget {
  final AsyncValue<CryptoListViewData> cryptoData;
  final String type;
  final String fromCrypto;

  const DropdownCrypto({
    Key? key,
    required this.cryptoData,
    required this.type,
    required this.fromCrypto,
  }) : super(key: key);

  @override
  ConsumerState<DropdownCrypto> createState() => _DropdownCryptoState();
}

class _DropdownCryptoState extends ConsumerState<DropdownCrypto> {
  List<CryptoViewData> listCrypto = [];
  CryptoViewData? dropdownValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        for (CryptoViewData crypto
            in widget.cryptoData.value!.cryptoViewDataList) {
          listCrypto.add(crypto);
        }

        if (widget.type == "from") {
          for (int index = 0; index < listCrypto.length; index++) {
            if (listCrypto[index].symbol == widget.fromCrypto) {
              dropdownValue = listCrypto[index];
              ref.watch(fromCryptoConvertAbrev.state).state =
                  listCrypto[index].symbol;
              ref.watch(fromCryptoCotacaoProvider.state).state =
                  double.parse(listCrypto[index].currentPrice.toString());
              break;
            }
          }
        } else if (widget.type == "to") {
          for (int index = 0; index < listCrypto.length; index++) {
            if (listCrypto[index].symbol == widget.fromCrypto) {
              if (index < listCrypto.length - 1) {
                dropdownValue = listCrypto[index + 1];
                ref.watch(toCryptoConvertAbrev.state).state =
                    dropdownValue!.symbol;
                ref.watch(toCryptoCotacaoProvider.state).state =
                    double.parse(dropdownValue!.currentPrice.toString());
                break;
              } else {
                dropdownValue = listCrypto[index - 1];
                ref.watch(toCryptoConvertAbrev.state).state =
                    dropdownValue!.symbol;
                ref.watch(toCryptoCotacaoProvider.state).state =
                    double.parse(dropdownValue!.currentPrice.toString());
                break;
              }
            }
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.grey.shade300,
          style: BorderStyle.solid,
          width: 0.80,
        ),
      ),
      child: DropdownButton<CryptoViewData>(
        value: dropdownValue,
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 25,
          color: widget.type != "to" ? Colors.transparent : Colors.black,
        ),
        onChanged: (CryptoViewData? cryptoItem) {
          setState(
            () {
              if (widget.type == "from") {
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
              } else if (widget.type == "to") {
                dropdownValue = cryptoItem!;
                ref.watch(toCryptoCotacaoProvider.state).state =
                    double.parse(cryptoItem.currentPrice.toString());
                ref.watch(toCryptoConvertAbrev.state).state = cryptoItem.symbol;
                ref.watch(resultConvertedValue.state).state =
                    (ref.watch(transferCryptoConverted.state).state /
                        ref.watch(toCryptoCotacaoProvider.state).state);
              }
            },
          );
        },
        items: listCrypto
            .map<DropdownMenuItem<CryptoViewData>>((CryptoViewData cryptoItem) {
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
    );
  }
}
