import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../convert/controller/providers.dart';
import '../providers/providers.dart';

class DefaultBigButton extends HookConsumerWidget {
  late double? cryptoQtdWallet;
  late String? cryptoAbrev;
  late Decimal? cryptoCotacao;
  final String title;

  DefaultBigButton({
    this.cryptoQtdWallet,
    this.cryptoAbrev,
    this.cryptoCotacao,
    required this.title,
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
          ref.watch(fromCryptoConvertAbrev.state).state = cryptoAbrev ?? "";
          ref.watch(cryptoQtdWalletCriptoProvider.state).state =
              cryptoQtdWallet ?? 0;
          ref.watch(fromCryptoCotacaoProvider.state).state =
              double.parse(cryptoCotacao.toString());
          Navigator.pushNamed(
            context,
            '/convert',
          );
        },
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
