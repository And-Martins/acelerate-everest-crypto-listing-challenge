import 'package:crypto_listing/l10n/translation_file.dart';
import 'package:flutter/material.dart';

class SetupLanguagesTest extends StatelessWidget {
  const SetupLanguagesTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(TranslationFile.of(context)!.language),
          Text(TranslationFile.of(context)!.movTitle),
          Text(TranslationFile.of(context)!.portTitle),
          Text(TranslationFile.of(context)!.transactionNotFoundTitle),
          Text(TranslationFile.of(context)!.transactionNotFoundSubtitle),
          Text(TranslationFile.of(context)!.walletTitle),
          Text(TranslationFile.of(context)!.walletSubtitle),
          Text(TranslationFile.of(context)!.detailTitleAppBar),
          Text(TranslationFile.of(context)!.item1Title),
          Text(TranslationFile.of(context)!.item2Title),
          Text(TranslationFile.of(context)!.item3Title),
          Text(TranslationFile.of(context)!.item4Title),
          Text(TranslationFile.of(context)!.convertButtonTitle),
          Text(TranslationFile.of(context)!.alertZeroMessage),
          Text(TranslationFile.of(context)!.alertQuantityMessage),
          Text(TranslationFile.of(context)!.convertTitle),
          Text(TranslationFile.of(context)!.convertBalance),
          Text(TranslationFile.of(context)!.convertText),
          Text(TranslationFile.of(context)!.convertTextTotal),
          Text(TranslationFile.of(context)!.reviewTitle),
          Text(TranslationFile.of(context)!.reviewText),
          Text(TranslationFile.of(context)!.item1TitleReview),
          Text(TranslationFile.of(context)!.item2TitleReview),
          Text(TranslationFile.of(context)!.item3TitleReview),
          Text(TranslationFile.of(context)!.reviewButton),
          Text(TranslationFile.of(context)!.completeTitle),
          Text(TranslationFile.of(context)!.completeSubtitle),
        ],
      ),
    );
  }
}
