import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TotalValue extends StatefulWidget {
  final double totalReais;

  const TotalValue({
    Key? key,
    required this.totalReais,
    required this.hideWallet,
  }) : super(key: key);

  final bool hideWallet;

  @override
  State<TotalValue> createState() => _TotalValueState();
}

class _TotalValueState extends State<TotalValue> {
  var format = NumberFormat('#,###.00#', 'pt_BR');

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.hideWallet,
      replacement: Text(
        'R\$ ${format.format(widget.totalReais)}',
        style:
            GoogleFonts.montserrat(fontSize: 32, fontWeight: FontWeight.w800),
      ),
      child: Container(
        color: Colors.grey,
        width: 305,
        height: 39,
      ),
    );
  }
}
