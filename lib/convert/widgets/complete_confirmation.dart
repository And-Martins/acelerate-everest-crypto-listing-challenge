import 'package:crypto_listing/shared/widgets/default_subtitle.dart';
import 'package:crypto_listing/shared/widgets/default_title.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/asset.dart';

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
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 150,
              child: Lottie.asset(
                confirmAnimation,
                repeat: false,
              ),
            ),
          ),
          const DefaultTitle(title: "Conversão efetuada"),
          const DefaultSubtitle('Conversão de moeda efetuada com sucesso!')
        ],
      ),
    );
  }
}
