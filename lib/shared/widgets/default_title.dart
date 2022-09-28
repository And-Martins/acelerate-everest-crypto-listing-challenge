import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTitle extends StatelessWidget {
  final String title;
  final double titleSize;
  final Color color;
  final int strong;

  const DefaultTitle({
    Key? key,
    required this.title,
    this.titleSize = 32,
    this.color = Colors.black,
    this.strong = 800,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontSize: titleSize,
        fontWeight: strong == 600 ? FontWeight.w600 : FontWeight.w800,
        color: color,
      ),
    );
  }
}
