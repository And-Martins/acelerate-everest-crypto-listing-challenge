import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTitle extends StatelessWidget {
  final String title;
  final Color color;

  const DefaultTitle({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
          fontSize: 32, fontWeight: FontWeight.w800, color: color),
    );
  }
}
