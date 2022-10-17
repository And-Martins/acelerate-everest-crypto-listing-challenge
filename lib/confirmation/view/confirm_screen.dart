import 'package:crypto_listing/wallet/view/wallet_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/confirm_body.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        leading: IconButton(
          key: const Key('backButtonConfirmScreen'),
          onPressed: () {
            // Navigator.pushReplacementNamed(
            //   context,
            //   '/wallet',
            // );
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WalletScreen()));
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: const ConfirmBody(),
    );
  }
}
