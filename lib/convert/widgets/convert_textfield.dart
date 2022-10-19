import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/providers/providers.dart';
import '../controller/providers.dart';

class ConvertTextfield extends StatefulHookConsumerWidget {
  const ConvertTextfield({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConvertTextfieldState();
}

class _ConvertTextfieldState extends ConsumerState<ConvertTextfield> {
  @override
  Widget build(BuildContext context) {
    final limitReachedMessage = SnackBar(
      backgroundColor: Colors.red,
      content: Text(AppLocalizations.of(context)!.alertQuantityMessage),
    );
    double fromCryptoCotacao = ref.watch(fromCryptoCotacaoProvider);
    TextEditingController formFieldController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: TextFormField(
        onChanged: (value) {
          if (double.parse(value) >
              ref.watch(cryptoQtdWalletCriptoProvider.state).state) {
            ScaffoldMessenger.of(context).showSnackBar(limitReachedMessage);
            setState(() {
              value = "";
            });
          }
          ref.watch(transferCryptoConverted.state).state =
              (double.parse(value) * fromCryptoCotacao);
          ref.watch(fieldTransferValue.state).state = value;
        },
        onFieldSubmitted: (value) {
          if (ref.watch(cryptoQtdWalletCriptoProvider) <
              double.parse(formFieldController.text.toString())) {
            ScaffoldMessenger.of(context).showSnackBar(limitReachedMessage);
          } else {
            ref.watch(resultConvertedValue.state).state =
                (ref.watch(transferCryptoConverted.state).state /
                    ref.watch(toCryptoCotacaoProvider.state).state);
          }
          FocusManager.instance.primaryFocus?.unfocus();
        },
        controller: formFieldController
          ..text = ref.watch(fieldTransferValue.state).state
          ..selection = TextSelection.collapsed(
              offset: ref.watch(fieldTransferValue.state).state.length),
        style: GoogleFonts.montserrat(
          fontSize: 30,
          color: const Color.fromRGBO(149, 151, 166, 1),
          fontWeight: FontWeight.w500,
        ),
        keyboardType: TextInputType.number,
        cursorHeight: 35,
        decoration: InputDecoration(
          hintText: "${ref.watch(fromCryptoConvertAbrev).toUpperCase()} 0,00",
          hintStyle: GoogleFonts.montserrat(
            fontSize: 35,
            color: const Color.fromRGBO(149, 151, 166, 1),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
