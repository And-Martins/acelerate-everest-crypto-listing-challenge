import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../convert/controller/providers.dart';
import '../providers/providers.dart';

// ignore: must_be_immutable
class DefaultBigButton extends HookConsumerWidget {
  final double? cryptoQtdWallet;
  final String? cryptoAbrev;
  final double? cryptoCotacao;
  final String title;
  final String? route;

  const DefaultBigButton({
    this.cryptoQtdWallet,
    this.cryptoAbrev,
    this.cryptoCotacao,
    this.route,
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
              double.parse(ref.watch(cryptoCotacaoProvider).toString());
          Navigator.pushNamed(
            context,
            '$route',
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
