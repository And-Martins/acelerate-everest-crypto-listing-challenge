import 'dart:async';

import 'package:crypto_listing/shared/models/wallet_model.dart';
import 'package:crypto_listing/wallet/widgets/cripto_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../shared/models/list_crypto_model.dart';
import '../../shared/repository/list_crypto_repository.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';
import 'hide_button.dart';
import 'total_value.dart';

class WalletBody extends StatefulWidget {
  const WalletBody({
    Key? key,
  }) : super(key: key);

  @override
  State<WalletBody> createState() => _WalletBodyState();
}

class _WalletBodyState extends State<WalletBody> {
  final scrollController = ScrollController();

  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(onListen);
    cryptos = repository.getList();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  ListCryptoRepository repository = ListCryptoRepository(Dio());
  late Future<List<CryptoModel>> cryptos;

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

  @override
  Widget build(BuildContext context) {
    double totalValue = 0;
    return Scaffold(
        body: FutureBuilder(
            future: cryptos,
            builder: (context, AsyncSnapshot<List<CryptoModel>> snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding:
                      const EdgeInsets.only(right: 10.0, left: 10.0, top: 50),
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
                          controller: scrollController,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            CryptoModel cryptoModel = snapshot.data![index];

                            final WalletModel walletModel = WalletModel(
                              quantityCoin: quantityCoin[index],
                              valueWalletCoin: double.parse(
                                  cryptoModel.currentPrice.toString()),
                              idCoin: cryptoModel.symbol,
                            );

                            //TODO: Fazer valor retornar ao iniciar;
                            totalValue = double.parse(
                                (cryptoModel.currentPrice *
                                        walletModel.quantityCoin)
                                    .toString());

                            final itemPositionOffset = index * 90;
                            final difference =
                                scrollController.offset - itemPositionOffset;
                            final percent = 1 - (difference / 45);
                            double opacity = percent;
                            double scale = percent;
                            if (opacity > 1.0) opacity = 1.0;
                            if (opacity < 0.0) opacity = 0.0;

                            if (percent > 1.0) scale = 1.0;
                            {
                              return Opacity(
                                opacity: opacity,
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..scale(scale, 1.0),
                                  child: CriptoItem(
                                    cryptoModel: cryptoModel,
                                    walletModel: walletModel,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
