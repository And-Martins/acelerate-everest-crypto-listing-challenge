import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/asset.dart';

import '../../l10n/translation_file.dart';
import '../../shared/widgets/default_subtitle.dart';
import '../../shared/widgets/default_title.dart';

class ConfirmBody extends StatelessWidget {
  const ConfirmBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(confirmAnimation,
              repeat: false,
              height: 150,
              key: const Key('animtaionConfirmScreen')),
          const SizedBox(height: 10),
          DefaultTitle(
            title: TranslationFile.of(context)!.completeTitle,
            key: const Key('defaultTitleConfirmScreen'),
          ),
          const SizedBox(height: 10),
          DefaultSubtitle(
            TranslationFile.of(context)!.completeSubtitle,
            center: true,
          )
        ],
      ),
    );
  }
}
