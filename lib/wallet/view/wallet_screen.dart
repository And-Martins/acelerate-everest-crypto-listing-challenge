import 'package:flutter/material.dart';

import '../../shared/widgets/default_navbar.dart';
import '../widgets/wallet_body.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WalletBody(),
      bottomNavigationBar: DefaultNavbar(
        selectedIndex: 0,
      ),
    );
  }
}
