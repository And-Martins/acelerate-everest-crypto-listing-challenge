import '../../../shared/template/wallet_providers.dart';
import '../../../use_cases/models/cripto_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../cripto_details/detail_screen.dart';

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
  var format = NumberFormat('#,###.00#', 'pt_BR');

  @override
  Widget build(BuildContext context) {
    final bool hideWallet = ref.watch(hideWalletStateProvider);
    CriptoModel criptoModel = widget.criptoModel;
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
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const DetailScreen();
                },
              ),
            );
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
                        "R\$ ${format.format(criptoModel.valueReais)}",
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
                  "${criptoModel.valueCripto} ${criptoModel.abbreviation}",
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
