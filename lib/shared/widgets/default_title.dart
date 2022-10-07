import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTitle extends StatelessWidget {
  final String title;
  final double titleSize;
  final Color color;
  final int strong;
  final bool center;

  const DefaultTitle({
    Key? key,
    required this.title,
    this.titleSize = 32,
    this.color = Colors.black,
    this.strong = 800,
    this.center = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontSize: titleSize,
        fontWeight: strong == 700 ? FontWeight.w700 : FontWeight.w800,
        color: color,
      ),
      textAlign: center == true ? TextAlign.center : TextAlign.left,
    );
  }
}
