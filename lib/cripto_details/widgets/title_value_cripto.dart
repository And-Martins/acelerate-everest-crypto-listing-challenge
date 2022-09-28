import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/widgets/number_formatter.dart';

class TitleValorCripto extends StatelessWidget {
  const TitleValorCripto({
    Key? key,
    required this.criptoCotacao,
  }) : super(key: key);

  final Decimal criptoCotacao;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        "R\$ ${formatReais.format(DecimalIntl(criptoCotacao))}",
        style: GoogleFonts.montserrat(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
