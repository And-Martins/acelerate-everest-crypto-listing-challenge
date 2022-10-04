import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../convert/controller/providers.dart';
import '../providers/providers.dart';

class DefaultBigButton extends HookConsumerWidget {
  final double cryptoQtdWallet;
  final String cryptoAbrev;
  final Decimal cryptoCotacao;

  const DefaultBigButton({
    required this.cryptoQtdWallet,
    required this.cryptoAbrev,
    required this.cryptoCotacao,
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
          ref.watch(fromCryptoConvertAbrev.state).state = cryptoAbrev;
          ref.watch(cryptoQtdWalletCriptoProvider.state).state =
              cryptoQtdWallet;
          ref.watch(fromCryptoCotacaoProvider.state).state =
              double.parse(cryptoCotacao.toString());
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
