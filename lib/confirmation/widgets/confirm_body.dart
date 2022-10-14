import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/asset.dart';
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
          Lottie.asset(
            confirmAnimation,
            repeat: false,
            height: 150,
          ),
          const SizedBox(height: 10),
          DefaultTitle(title: AppLocalizations.of(context)!.completeTitle),
          const SizedBox(height: 10),
          DefaultSubtitle(
            AppLocalizations.of(context)!.completeSubtitle,
            center: true,
          )
        ],
      ),
    );
  }
}
