import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSize {
  final String title;
  final double titleSize;

  const DefaultAppbar({
    Key? key,
    required this.title,
    required this.titleSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.white,
      elevation: 1,
      title: Text(
        title,
        style: GoogleFonts.sourceSansPro(
          fontSize: titleSize,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);

  @override
  Widget get child => throw UnimplementedError();
}
