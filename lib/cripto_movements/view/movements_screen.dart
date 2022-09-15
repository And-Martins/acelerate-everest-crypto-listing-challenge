import 'package:crypto_listing/shared/widgets/default_title.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/navbar_wallet.dart';

class MovementsScreen extends StatelessWidget {
  const MovementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 25),
            child: DefaultTitle(title: "Movimentações"),
          ),
        ],
      ),
      bottomNavigationBar: const NavbarWallet(
        selectedIndex: 1,
      ),
    );
  }
}
