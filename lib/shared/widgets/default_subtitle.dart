import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultSubtitle extends StatelessWidget {
  final String message;
  const DefaultSubtitle(
    this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: GoogleFonts.montserrat(
        fontSize: 17,
        color: const Color.fromRGBO(117, 118, 128, 1),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
