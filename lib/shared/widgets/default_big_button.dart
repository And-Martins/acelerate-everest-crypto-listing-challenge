import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../convert/controller/providers.dart';
import '../providers/providers.dart';

class DefaultBigButton extends HookConsumerWidget {
  final double cryptoQtdWallet;
  final String criptoAbrev;
  final String criptoImg;

  const DefaultBigButton({
    this.cryptoQtdWallet = 0,
    this.criptoAbrev = '',
    this.criptoImg = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
        onPressed: () {
          ref.watch(fromCryptoConvertAbrev.state).state = criptoAbrev;
          // ref.watch(fromCryptoConvertImg.state).state = cripto;

          ref.watch(criptoQtdWalletCriptoProvider.state).state =
              cryptoQtdWallet;
          Navigator.pushNamed(
            context,
            '/convert',
          );
        },
        child: const Text(
          "Converter moeda",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
