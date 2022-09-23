import 'package:crypto_listing/wallet/controller/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/wallet_model.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';
import '../model/crypto_list_view_data.dart';
import '../model/crypto_view_data.dart';
import 'cripto_item.dart';
import 'hide_button.dart';
import 'total_value.dart';

class WalletBody extends HookConsumerWidget {
  const WalletBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ScrollController();

    List<double> quantityCoin = [
      0.65554321,
      0.94,
      0.82,
      1.0,
      0.03,
      0.25,
      1.8,
      0.8978,
      0.74,
      0.80
    ];

    double totalValue = 0.0;

    return FutureBuilder(
      future: ref.watch(listCryptoProvider.future),
      builder: (context, AsyncSnapshot<CryptoListViewData> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    DefaultTitle(
                      title: 'Cripto',
                      color: Color.fromRGBO(224, 43, 87, 1),
                    ),
                    HideButton(),
                  ],
                ),
                TotalValue(totalReais: totalValue),
                const DefaultSubtitle('Valor total de moedas'),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    // controller: scrollController,
                    itemCount: snapshot.data!.cryptoViewDataList.length,
                    itemBuilder: (context, index) {
                      CryptoViewData cryptoData =
                          snapshot.data!.cryptoViewDataList[index];

                      final WalletModel walletModel = WalletModel(
                        quantityCoin: quantityCoin[index],
                        valueWalletCoin: snapshot
                            .data!.cryptoViewDataList[index].currentPrice,
                        idCoin: cryptoData.symbol,
                      );

                      //   //TODO: Fazer valor retornar ao iniciar;
                      //   totalValue = double.parse(
                      //       (cryptoModel.currentPrice * walletModel.quantityCoin)
                      //           .toString());

                      //   final itemPositionOffset = index * 90;
                      //   final difference =
                      //       scrollController.offset - itemPositionOffset;
                      //   final percent = 1 - (difference / 45);
                      //   double opacity = percent;
                      //   double scale = percent;
                      //   if (opacity > 1.0) opacity = 1.0;
                      //   if (opacity < 0.0) opacity = 0.0;

                      //   if (percent > 1.0) scale = 1.0;
                      //   {
                      //     return Opacity(
                      //       opacity: opacity,
                      //       child: Transform(
                      //         alignment: Alignment.center,
                      //         transform: Matrix4.identity()..scale(scale, 1.0),
                      //         child:
                      return CriptoItem(
                        cryptoData: cryptoData,
                        walletModel: walletModel,
                      );
                      //       ),
                      //     );
                      // }
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// class WalletBodyState extends ConsumerState<WalletBody> {
//   final scrollController = ScrollController();

//   void onListen() {
//     setState(() {});
//   }

//   @override
//   void initState() {
//     scrollController.addListener(onListen);
//     // cryptos = repository.getList();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     scrollController.removeListener(onListen);
//     super.dispose();
//   }

//   // ListCryptoRepository repository = ListCryptoRepository(Dio());
//   // late Future<List<CryptoModel>> cryptos;

//   List<double> quantityCoin = [
//     0.65554321,
//     0.94,
//     0.82,
//     1.0,
//     0.03,
//     0.25,
//     1.8,
//     0.8978,
//     0.74,
//     0.80
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
