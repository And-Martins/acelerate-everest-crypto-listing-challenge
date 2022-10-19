import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../review/view/review_page.dart';
import '../../shared/providers/providers.dart';
import '../controller/providers.dart';

class ConfirmButton extends HookConsumerWidget {
  const ConfirmButton({
    Key? key,
    required this.zeroAlert,
  }) : super(key: key);

  final SnackBar zeroAlert;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        if (ref.watch(cryptoQtdWalletCriptoProvider) <
            double.parse(ref.watch(fieldTransferValue.state).state)) {
        } else {
          ref.watch(resultConvertedValue.state).state =
              (ref.watch(transferCryptoConverted.state).state /
                  ref.watch(toCryptoCotacaoProvider.state).state);
        }
        FocusManager.instance.primaryFocus?.unfocus();
        if (ref.watch(fieldTransferValue.state).state != "") {
          // Navigator.pushNamed(
          //   context,
          //   '/confirmConversion',
          // );
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ReviewPage()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(zeroAlert);
        }
      },
      backgroundColor: Colors.pink.shade500,
      child: const Icon(
        Icons.arrow_forward,
        size: 25,
        color: Colors.white,
      ),
    );
  }
}
