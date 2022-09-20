import 'package:crypto_listing/wallet/widgets/cripto_item.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../list_cripto_api/list_crypto_model.dart';
import '../../list_cripto_api/list_crypto_repository.dart';
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
  late Future<List<ListCryptoModel>> cryptos;

  // final List<CriptoModel> criptoModelList = [
  //   CriptoModel(
  //     abbreviation: 'BTC',
  //     name: 'Bitcoin',
  //     valueWalletCripto: 6557,
  //     valueQtdWalletCripto: 0.65554321,
  //     image: btcImage,
  //     cotacao: 103612.60,
  //     variacao: -0.5,
  //   ),
  //   CriptoModel(
  //     abbreviation: 'ETC',
  //     name: 'Ethereum',
  //     valueWalletCripto: 7996,
  //     valueQtdWalletCripto: 0.94,
  //     image: ethImage,
  //     cotacao: 8254.17,
  //     variacao: 1.20,
  //   ),
  //   CriptoModel(
  //     abbreviation: 'LTC',
  //     name: 'Litecoin',
  //     valueWalletCripto: 245,
  //     valueQtdWalletCripto: 0.82,
  //     image: ltcImage,
  //     cotacao: 312.06,
  //     variacao: 5,
  //   ),
  //   CriptoModel(
  //     abbreviation: 'BTC',
  //     name: 'Bitcoin',
  //     valueWalletCripto: 6557,
  //     valueQtdWalletCripto: 0.65554321,
  //     image: btcImage,
  //     cotacao: 103612.60,
  //     variacao: -0.5,
  //   ),
  //   CriptoModel(
  //     abbreviation: 'ETC',
  //     name: 'Ethereum',
  //     valueWalletCripto: 7996,
  //     valueQtdWalletCripto: 0.94,
  //     image: ethImage,
  //     cotacao: 8254.17,
  //     variacao: 1.20,
  //   ),
  //   CriptoModel(
  //     abbreviation: 'LTC',
  //     name: 'Litecoin',
  //     valueWalletCripto: 245,
  //     valueQtdWalletCripto: 0.82,
  //     image: ltcImage,
  //     cotacao: 312.06,
  //     variacao: 5,
  //   ),
  //   CriptoModel(
  //     abbreviation: 'BTC',
  //     name: 'Bitcoin',
  //     valueWalletCripto: 6557,
  //     valueQtdWalletCripto: 0.65554321,
  //     image: btcImage,
  //     cotacao: 103612.60,
  //     variacao: -0.5,
  //   ),
  //   CriptoModel(
  //     abbreviation: 'ETC',
  //     name: 'Ethereum',
  //     valueWalletCripto: 7996,
  //     valueQtdWalletCripto: 0.94,
  //     image: ethImage,
  //     cotacao: 8254.17,
  //     variacao: 1.20,
  //   ),
  //   CriptoModel(
  //     abbreviation: 'LTC',
  //     name: 'Litecoin',
  //     valueWalletCripto: 245,
  //     valueQtdWalletCripto: 0.82,
  //     image: ltcImage,
  //     cotacao: 312.06,
  //     variacao: 5,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: cryptos,
        builder: (context, AsyncSnapshot<List<ListCryptoModel>> snapshot) {
          if (snapshot.hasData) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
                controller: scrollController,
      itemCount: snapshot.data!.length,
      itemBuilder: ((context, index) {
        ListCryptoModel listCryptoModel = snapshot.data![index];
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
            const TotalValue(totalReais: 14798),
            const DefaultSubtitle('Valor total de moedas'),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemBuilder: (context, index) {
                  final itemPositionOffset = index * 90;
                  final difference = scrollController.offset - itemPositionOffset;
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
                        transform: Matrix4.identity()..scale(scale, 1.0),
                        child: CriptoItem(
                          criptoModel: listCryptoModel[index],
                        ),
                      ),
                    );
                  }
                },
                itemCount: listCryptoModel.length,
              ),
            ),
          ],
        ),
      );
      }),
    );
  }else{
    return const Center(child: CircularProgressIndicator());
  }
};
    ),);