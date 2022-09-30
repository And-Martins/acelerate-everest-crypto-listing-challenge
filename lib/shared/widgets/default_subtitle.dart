import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultSubtitle extends StatelessWidget {
  final String message;
  final int strong;
  final Color color;

  const DefaultSubtitle(
    this.message, {
    this.strong = 400,
    this.color = const Color.fromRGBO(117, 118, 128, 1),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: GoogleFonts.montserrat(
        fontSize: 17,
        color: color,
        fontWeight: strong == 600
            ? FontWeight.w700
            : strong == 500
                ? FontWeight.w500
                : FontWeight.w400,
      ),
    );
  }
}
