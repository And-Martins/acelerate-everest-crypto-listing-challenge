import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:crypto_listing/shared/providers/wallet_providers.dart';

class ButtonDay extends StatefulHookConsumerWidget {
  final String text;
  late int days;

  ButtonDay({
    Key? key,
    required this.text,
    required this.days,
  }) : super(key: key);

  @override
  ConsumerState<ButtonDay> createState() => _ButtonDayState();
}

class _ButtonDayState extends ConsumerState<ButtonDay> {
  @override
  Widget build(BuildContext context) {
    final double criptoVariacao = ref.watch(criptoVariacaoProvider);
    final int criptoDaySelected = ref.watch(criptoDaysProvider);
    return SizedBox(
      width: 61,
      height: 35,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              widget.days == criptoDaySelected ? Colors.grey.shade300 : null),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        onPressed: () {
          ref.watch(criptoDaysProvider.state).state = widget.days;
          // print(widget.days);
          // if (widget.days / 10 > criptoVariacao) {
          //   ref.watch(criptoVariacaoProvider.state).state =
          //       ((widget.days / 10) + criptoVariacao);
          // } else {
          //   ref.watch(criptoVariacaoProvider.state).state =
          //       ((widget.days / 10) - criptoVariacao);
          // }

          setState(() {});
        },
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
