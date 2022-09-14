import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovementsScreen extends StatelessWidget {
  const MovementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 1,
        title: Text(
          "Movimentações",
          style: GoogleFonts.sourceSansPro(
            fontSize: 23,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(),
    );
  }
}
