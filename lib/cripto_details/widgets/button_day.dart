import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers/providers.dart';

class ButtonDay extends StatefulHookConsumerWidget {
  final String text;
  final int days;

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
    final int criptoDaySelected = ref.watch(cryptoDaysProvider);
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
          ref.watch(cryptoDaysProvider.state).state = widget.days;
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
