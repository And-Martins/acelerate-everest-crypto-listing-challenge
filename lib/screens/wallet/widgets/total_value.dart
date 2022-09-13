import 'package:crypto_listing/shared/template/wallet_providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class TotalValue extends StatefulHookConsumerWidget {
  final double totalReais;

  const TotalValue({
    Key? key,
    required this.totalReais,
  }) : super(key: key);

  @override
  ConsumerState<TotalValue> createState() => _TotalValueState();
}

class _TotalValueState extends ConsumerState<TotalValue> {
  var format = NumberFormat('#,###.00#', 'pt_BR');
  // var formatter = NumberFormat.decimalPattern('pt-BR');

  @override
  Widget build(BuildContext context) {
    final bool hideWallet = ref.watch(hideWalletStateProvider);
    return Visibility(
      visible: hideWallet,
      replacement: Text(
        'R\$ ${format.format(widget.totalReais)}',
        // 'R\$ ${formatter.format(DecimalIntl(Decimal.parse('${widget.totalReais}')))}',
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
