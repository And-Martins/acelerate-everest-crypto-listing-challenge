import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/widgets/number_formatter.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({
    Key? key,
    required this.criptoAbrev,
    required this.criptoCotacao,
    required this.criptoVariacao,
    required this.criptoQtdWallet,
    required this.criptoValueWalletReais,
    required this.text,
    required this.option,
  }) : super(key: key);

  final String criptoAbrev;
  final double criptoCotacao;
  final double criptoVariacao;
  final double criptoQtdWallet;
  final double criptoValueWalletReais;
  final String text;
  final int option;

  @override
  Widget build(BuildContext context) {
    var cotacao = Decimal.parse(criptoCotacao.toString());
    double variacao = criptoVariacao;
    var criptoQtd = Decimal.parse(criptoQtdWallet.toString());
    var criptoValueReais = Decimal.parse(criptoValueWalletReais.toString());

    return Column(
      children: [
        const Divider(
          thickness: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 19,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                option == 1
                    ? Text(
                        "R\$ ${formatReais.format(DecimalIntl(cotacao))}",
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 19,
                          color: Colors.grey.shade800,
                        ),
                      )
                    : option == 2
                        ? variacao <= 0.00
                            ? Text(
                                "$variacao%",
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 19,
                                  color: Colors.red.shade800,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            : Text(
                                "+$variacao%",
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 19,
                                  color: Colors.green.shade800,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                        : option == 3
                            ? Text(
                                "${formatCriptoCompleto.format(DecimalIntl(criptoQtd))} $criptoAbrev",
                                style: GoogleFonts.sourceSansPro(
                                  fontSize: 19,
                                  color: Colors.grey.shade800,
                                ),
                              )
                            : option == 4
                                ? Text(
                                    "R\$ ${formatReais.format(DecimalIntl(criptoValueReais))}",
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 19,
                                      color: Colors.grey.shade800,
                                    ),
                                  )
                                : const Text(
                                    " ",
                                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
