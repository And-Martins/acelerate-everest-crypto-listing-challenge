import 'package:flutter/material.dart';

import '../utils/asset.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/cripto_item.dart';
import 'widgets/hide_button.dart';
import 'widgets/message_wallet.dart';
import 'widgets/navbar_wallet.dart';
import 'widgets/title_wallet.dart';
import 'widgets/total_value.dart';

final hideWalletStateProvider = StateProvider((ref) => true);

class WalletScreen extends StatefulHookConsumerWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
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
    bool hideWallet = ref.watch(hideWalletStateProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10.0, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TitleWallet('Cripto'),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: HideButton(),
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
      bottomNavigationBar: NavbarWallet(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
