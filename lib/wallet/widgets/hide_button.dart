import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/providers.dart';

class HideButton extends HookConsumerWidget {
  const HideButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool hideValue = ref.watch(hideWalletStateProvider);

    return IconButton(
      onPressed: () {
        ref.read(hideWalletStateProvider.state).state = !hideValue;
      },
      icon: hideValue
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.remove_red_eye),
    );
  }
}
