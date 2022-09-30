import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../wallet/model/crypto_list_view_data.dart';
import '../../wallet/model/crypto_view_data.dart';

class DropdownCrypto extends StatefulWidget {
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
  State<DropdownCrypto> createState() => _DropdownCryptoState();
}

class _DropdownCryptoState extends State<DropdownCrypto> {
  List<CryptoViewData> listCrypto = [];
  CryptoViewData? dropdownValue;

  @override
  void initState() {
    super.initState();
    for (CryptoViewData crypto in widget.cryptoData.value!.cryptoViewDataList) {
      listCrypto.add(crypto);
    }
    if (widget.type == "from") {
      for (int index = 0; index <= listCrypto.length; index++) {
        if (listCrypto[index].symbol == widget.fromCrypto) {
          dropdownValue = listCrypto[index];
          break;
        }
      }
    } else if (widget.type == "to") {
      for (int index = 0; index <= listCrypto.length; index++) {
        if (listCrypto[index].symbol == widget.fromCrypto) {
          if (index < listCrypto.length - 1) {
            dropdownValue = listCrypto[index + 1];
          } else {
            dropdownValue = listCrypto[index - 1];
          }
          break;
        }
      }
    }
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
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          size: 25,
        ),
        onChanged: (CryptoViewData? cryptoItem) {
          setState(() {
            dropdownValue = cryptoItem!;
          });
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
