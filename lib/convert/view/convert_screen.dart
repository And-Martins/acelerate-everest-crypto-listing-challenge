import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/providers.dart';
import '../../wallet/controller/crypto_provider.dart';
import '../../wallet/model/crypto_view_data.dart';

class ConvertScreen extends StatefulHookConsumerWidget {
  const ConvertScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConvertScreen> createState() => _ConvertScreenState();
}


class _ConvertScreenState extends ConsumerState<ConvertScreen> {
  @override
  Widget build(BuildContext context) {

void dropdownCallback(String? selectecValue){
  if(selectecValue is String){
    setState((){
      _dropdownValue = selectecValue;
    });
  }
}
    final cryptoData = ref.watch(listCryptoProvider);
    return cryptoData.when(
      data: (data){
        List<CryptoViewData> cryptoList = data.cryptoViewDataList.where((item) => item.symbol != ref.watch(criptoAbrevProvider)).toList();
        String selectedCrypto = cryptoList[0].symbol.toUpperCase();
        return Scaffold(
      appBar: DefaultAppbar(
        title: "Converter",
        titleSize: 23,
        appBar: AppBar(),
      ),
      body: Column(
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
          // ElevatedButton(
          //     onPressed: () {
          //       print(cryptoData.toString());
          //     },
          //     child: const Text('teste')),

          Expanded(
            child: FutureBuilder(
              future: ref.watch(listCryptoProvider.future),
              builder: (context, AsyncSnapshot<CryptoListViewData> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.cryptoViewDataList.length,
                    itemBuilder: (context, index) {
                      CryptoViewData cryptoData =
                          snapshot.data!.cryptoViewDataList[index];
                      return 
                      DropdownButton(items:  [
                        DropdownMenuItem(value: cryptoData.id.toString(),child: Text(cryptoData.name.toString()))
                      ], 
                      value: _dropdownValue,
                      onChanged: onChanged,)))
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          )
          // FutureBuilder(
          //   future: cryptoList,
          //   builder: (context, AsyncSnapshot<CryptoListViewData> snapshot) {
          //     if (snapshot.hasData) {
          //       return DropdownButton(
          //         items:
          //         DropdownMenuItem(child: Text(cryptoList.name.)),
          //         onChanged: onChanged,
          //       );
          //     } else {
          //       return const Center(child: CircularProgressIndicator());
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
    }, error: (Object error, StackTrace? stackTrace) { 
      debugPrintStack(stackTrace: stackTrace);
      return const Text('Erro');
     }, loading: () { return const Center(child: CircularProgressIndicator());  });
