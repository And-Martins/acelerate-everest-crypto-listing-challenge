import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/template/navbar_wallet.dart';
import 'package:flutter/material.dart';

import '../cripto_movements/movements_screen.dart';
import 'widgets/wallet_body.dart';

class WalletScreen extends StatefulHookConsumerWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  late int selectedIndex = 0;
  final List<Widget> telas = [
    WalletBody(),
    const MovementsScreen(),
  ];

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
      body: telas[selectedIndex],
      bottomNavigationBar: NavbarWallet(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}
