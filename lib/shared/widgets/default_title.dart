import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTitle extends StatelessWidget {
  final String title;
  final double titleSize;
  final Color color;

  const DefaultTitle({
    Key? key,
    required this.title,
    this.titleSize = 32,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontSize: titleSize,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }
}
