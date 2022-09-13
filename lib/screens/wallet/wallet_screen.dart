import '../../shared/template/default_title.dart';
import 'widgets/cripto_item.dart';
import '../../use_cases/models/cripto_model.dart';
import 'package:flutter/material.dart';

import '../../core/asset.dart';
import '../../shared/template/navbar_wallet.dart';
import 'widgets/hide_button.dart';
import '../../shared/template/default_subtitle.dart';
import 'widgets/total_value.dart';

class WalletScreen extends StatefulWidget {
  WalletScreen({Key? key}) : super(key: key);

  final List<CriptoModel> criptoModelList = [
    CriptoModel(
      abbreviation: 'BTC',
      name: 'Bitcoin',
      valueReais: 6557,
      valueCripto: 0.65,
      image: btcImage,
    ),
    CriptoModel(
      abbreviation: 'ETC',
      name: 'Ethereum',
      valueReais: 7996,
      valueCripto: 0.94,
      image: ethImage,
    ),
    CriptoModel(
      abbreviation: 'LTC',
      name: 'Litecoin',
      valueReais: 245,
      valueCripto: 0.82,
      image: ltcImage,
    ),
  ];

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(
      () {
        selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                    criptoModel: widget.criptoModelList[index],
                  );
                },
                itemCount: widget.criptoModelList.length,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavbarWallet(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
