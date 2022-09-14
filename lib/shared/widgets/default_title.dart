import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTitle extends StatelessWidget {
  final String title;

  const DefaultTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: const Color.fromRGBO(224, 43, 87, 1)),
    );
  }
}
