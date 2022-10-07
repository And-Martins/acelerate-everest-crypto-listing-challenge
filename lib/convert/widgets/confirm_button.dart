import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/providers.dart';

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
        if (ref.watch(fieldTransferValue.state).state != "") {
          Navigator.pushNamed(
            context,
            '/confirm-conversion',
          );
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