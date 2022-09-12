import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CriptoItem extends StatelessWidget {
  final String abbreviation;
  final String name;
  final double valueReais;
  final double valueCripto;
  final String image;

  CriptoItem({
    Key? key,
    required this.abbreviation,
    required this.name,
    required this.valueReais,
    required this.valueCripto,
    required this.image,
    required this.hideWallet,
  }) : super(key: key);

  final bool hideWallet;

  var format = NumberFormat('#,###.00#', 'pt_BR');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(image)),
      title: Text(
        abbreviation,
        style: GoogleFonts.sourceSansPro(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        name,
        style: GoogleFonts.sourceSansPro(
          fontSize: 15,
          color: const Color.fromRGBO(117, 118, 128, 1),
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: hideWallet,
                  replacement: Text(
                    "R\$ ${format.format(valueReais)}",
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  child: Container(
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width - 320.5,
                    height: 13,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_right_outlined,
                  size: 30,
                )
              ],
            ),
          ),
          Visibility(
            visible: hideWallet,
            replacement: Text(
              "$valueCripto $abbreviation",
              style: GoogleFonts.sourceSansPro(
                fontSize: 15,
                color: const Color.fromRGBO(117, 118, 128, 1),
                fontWeight: FontWeight.w400,
              ),
            ),
            child: Container(
              color: Colors.grey,
              width: MediaQuery.of(context).size.width - 355.5,
              height: 18.8,
            ),
          ),
        ],
      ),
    );
  }
}
