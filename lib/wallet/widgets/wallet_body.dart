import 'package:flutter/material.dart';

import '../../core/asset.dart';
import '../../shared/models/cripto_model.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';
import 'cripto_item.dart';
import 'hide_button.dart';
import 'total_value.dart';

class WalletBody extends StatelessWidget {
  WalletBody({
    Key? key,
  }) : super(key: key);

  final List<CriptoModel> criptoModelList = [
    CriptoModel(
      abbreviation: 'BTC',
      name: 'Bitcoin',
      valueWalletCripto: 6557,
      valueQtdWalletCripto: 0.65554321,
      image: btcImage,
      cotacao: 104572.44,
      variacao: -0.5,
    ),
    CriptoModel(
      abbreviation: 'ETC',
      name: 'Ethereum',
      valueWalletCripto: 7996,
      valueQtdWalletCripto: 0.94,
      image: ethImage,
      cotacao: 8254.17,
      variacao: 1.20,
    ),
    CriptoModel(
      abbreviation: 'LTC',
      name: 'Litecoin',
      valueWalletCripto: 245,
      valueQtdWalletCripto: 0.82,
      image: ltcImage,
      cotacao: 312.06,
      variacao: 5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
          const TotalValue(
            totalReais: 14798,
          ),
          const DefaultSubtitle('Valor total de moedas'),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return CriptoItem(
                  criptoModel: criptoModelList[index],
                );
              },
              itemCount: criptoModelList.length,
            ),
          ),
        ],
      ),
    );
  }
}
