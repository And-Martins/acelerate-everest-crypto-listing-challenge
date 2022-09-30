import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../wallet/model/crypto_list_view_data.dart';
import '../../wallet/model/crypto_view_data.dart';

class DropdownCrypto extends StatefulWidget {
  final AsyncValue<CryptoListViewData> cryptoData;

  const DropdownCrypto({
    Key? key,
    required this.cryptoData,
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

    dropdownValue = listCrypto.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CryptoViewData>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
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
    );
  }
}
