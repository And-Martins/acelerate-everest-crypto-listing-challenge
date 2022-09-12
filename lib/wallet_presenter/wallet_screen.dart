import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:crypto_listing/utils/asset.dart';

import 'widgets/cripto_item.dart';
import 'widgets/message_wallet.dart';
import 'widgets/title_wallet.dart';
import 'widgets/total_value.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool hideWallet = true;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
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
              children: [
                const TitleWallet('Cripto'),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    onPressed: () {
                      hideWallet
                          ? setState(() => hideWallet = false)
                          : setState(() => hideWallet = true);
                    },
                    icon: hideWallet
                        ? const Icon(Icons.remove_red_eye_outlined)
                        : const Icon(Icons.remove_red_eye),
                  ),
                ),
              ],
            ),
            TotalValue(
              hideWallet: hideWallet,
              totalReais: 14798.00,
            ),
            const MessageWallet('Valor total de moedas'),
            Expanded(
              child: ListView(
                children: [
                  CriptoItem(
                    abbreviation: 'BTC',
                    name: 'Bitcoin',
                    valueReais: 6557.0,
                    valueCripto: 0.65,
                    image: btc,
                    hideWallet: hideWallet,
                  ),
                  CriptoItem(
                    abbreviation: 'ETC',
                    name: 'Ethereum',
                    valueReais: 7996.00,
                    valueCripto: 0.94,
                    image: eth,
                    hideWallet: hideWallet,
                  ),
                  CriptoItem(
                    abbreviation: 'LTC',
                    name: 'Litecoin',
                    valueReais: 245.00,
                    valueCripto: 0.82,
                    image: ltc,
                    hideWallet: hideWallet,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              portifolioIcon,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(portifolioIcon),
            label: 'Portifólio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              movimentacoesIcon,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(movimentacoesIcon),
            label: 'Movimentações',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
