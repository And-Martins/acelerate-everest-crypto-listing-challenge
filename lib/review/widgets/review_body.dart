import '../../l10n/translation_file.dart';
import 'confirm_review_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../convert/controller/providers.dart';
import '../../cripto_details/widgets/item_detail.dart';
import '../../shared/providers/providers.dart';
import '../../shared/widgets/default_title.dart';

class ReviewBody extends HookConsumerWidget {
  const ReviewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: DefaultTitle(
                title: TranslationFile.of(context)!.reviewText,
                strong: 700,
              ),
            ),
            const SizedBox(height: 195),
            ItemDetail(
              option: 3,
              criptoAbrev:
                  ref.watch(fromCryptoConvertAbrev.state).state.toUpperCase(),
              criptoQtdWallet: ref.watch(fieldTransferValue.state).state != ""
                  ? double.parse(ref.watch(fieldTransferValue.state).state)
                  : 0.0,
              text: TranslationFile.of(context)!.item1TitleReview,
            ),
            ItemDetail(
              option: 3,
              criptoAbrev:
                  ref.watch(toCryptoConvertAbrev.state).state.toUpperCase(),
              criptoQtdWallet: ref.watch(resultConvertedValue.state).state,
              text: TranslationFile.of(context)!.item2TitleReview,
            ),
            ItemDetail(
              option: 5,
              criptoAbrev:
                  ref.watch(fromCryptoConvertAbrev.state).state.toUpperCase(),
              criptoAbrevTo:
                  ref.watch(toCryptoConvertAbrev.state).state.toUpperCase(),
              criptoQtdWallet: ref.watch(toCryptoCotacaoProvider.state).state,
              text: TranslationFile.of(context)!.item3TitleReview,
            ),
            const ConfirmReviewButton()
          ],
        ),
      ),
    );
  }
}
