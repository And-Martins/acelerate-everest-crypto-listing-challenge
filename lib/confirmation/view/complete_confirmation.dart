import 'package:flutter/material.dart';

import '../widgets/confirm_body.dart';

class CompleteConfirmation extends StatelessWidget {
  const CompleteConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/wallet',
            );
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: const ConfirmBody(),
    );
  }
}
