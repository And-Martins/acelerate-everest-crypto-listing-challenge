import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../l10n/translation_file.dart';
import '../../shared/widgets/default_appbar.dart';
import '../widgets/confirm_button.dart';
import '../widgets/convert_body.dart';

class ConvertScreen extends StatelessWidget {
  const ConvertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zeroAlert = SnackBar(
      backgroundColor: Colors.red,
      content: Text(TranslationFile.of(context)!.alertZeroMessage),
    );

    return Scaffold(
      appBar: DefaultAppbar(
        title: TranslationFile.of(context)!.convertTitle,
        titleSize: 23,
      ),
      body: const ConvertBody(),
      floatingActionButton: ConfirmButton(
        zeroAlert: zeroAlert,
        key: const Key('confirmButtonConvertScreen'),
      ),
    );
  }
}
