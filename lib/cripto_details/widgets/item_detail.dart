import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/widgets/number_formatter.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({
    Key? key,
    this.criptoAbrev = '',
    this.criptoAbrevTo = '',
    this.criptoCotacao = 0.0,
    this.criptoVariacao = 0.0,
    this.criptoQtdWallet = 0.0,
    this.criptoValueWalletReais = 0.0,
    this.option,
    required this.text,
  }) : super(key: key);

  final String? criptoAbrev;
  final String? criptoAbrevTo;
  final double? criptoCotacao;
  final double? criptoVariacao;
  final double? criptoQtdWallet;
  final double? criptoValueWalletReais;
  final String text;
  final int? option;

  @override
  Widget build(BuildContext context) {
    var cotacao = Decimal.parse(criptoCotacao.toString());
    double variacao = criptoVariacao ?? 0.0;
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
                                "${formatCriptoCompleto.format(DecimalIntl(criptoQtd))} ${criptoAbrev!.toUpperCase()}",
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
                                : option == 5
                                    ? Text(
                                        "1 ${criptoAbrev ?? "".toUpperCase()} = ${criptoQtd.toStringAsFixed(8)} ${criptoAbrevTo!.toUpperCase()}",
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 19,
                                          color: Colors.grey.shade800,
                                        ),
                                      )
                                    : const Text(
                                        " ",
                                      )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
