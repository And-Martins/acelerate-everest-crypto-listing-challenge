import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/models/cripto_model.dart';
import '../../shared/providers/wallet_providers.dart';
import '../../shared/widgets/number_formatter.dart';

class CriptoItem extends StatefulHookConsumerWidget {
  final CriptoModel criptoModel;

  const CriptoItem({
    required this.criptoModel,
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<CriptoItem> createState() => _CriptoItemState();
}

class _CriptoItemState extends ConsumerState<CriptoItem> {
  @override
  Widget build(BuildContext context) {
    final bool hideWallet = ref.watch(hideWalletStateProvider);
    CriptoModel criptoModel = widget.criptoModel;

    var criptoValueWalletReais =
        Decimal.parse(criptoModel.valueWalletCripto.toString());
    var criptoValueQtdWallet =
        Decimal.parse(criptoModel.valueQtdWalletCripto.toString());

    return Column(
      children: [
        const Divider(
          thickness: 1,
        ),
        ListTile(
          onTap: () {
            ref.watch(criptoNameProvider.state).state = criptoModel.name;
            ref.watch(criptoAbrevProvider.state).state =
                criptoModel.abbreviation;
            ref.watch(criptoImageProvider.state).state = criptoModel.image;
            ref.watch(criptoCotacaoProvider.state).state = criptoModel.cotacao;
            ref.watch(criptoVariacaoProvider.state).state =
                criptoModel.variacao;
            ref.watch(criptoValueWalletReaisProvider.state).state =
                criptoModel.valueWalletCripto;
            ref.watch(criptoQtdWalletCriptoProvider.state).state =
                criptoModel.valueQtdWalletCripto;
          },
          leading: CircleAvatar(backgroundImage: AssetImage(criptoModel.image)),
          title: Text(
            criptoModel.abbreviation,
            style: GoogleFonts.sourceSansPro(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            criptoModel.name,
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
                        "R\$ ${formatReais.format(DecimalIntl(criptoValueWalletReais))}",
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
                  "${formatCriptoAbrev.format(DecimalIntl(criptoValueQtdWallet))} ${criptoModel.abbreviation}",
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
        ),
      ],
    );
  }
}
