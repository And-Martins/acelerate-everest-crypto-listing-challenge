import 'package:crypto_listing/shared/providers/wallet_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../list_cripto_currency.dart';

class ButtonDay extends StatefulHookConsumerWidget {
  final String text;
  final double days;

  const ButtonDay({
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
    Color colorChange = const Color.fromRGBO(250, 250, 250, 1);
    return SizedBox(
      width: 61,
      height: 35,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(colorChange),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
        onPressed: () {
          listCriptoCurrencyChangeDay(
              ref.watch(criptoDaysProvider.state).state = widget.days);
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
