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
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: DefaultTitle(
              title: 'Revise os dados da sua conversão',
              strong: 700,
            ),
          ),
          const SizedBox(height: 195),
          ItemDetail(
            option: 3,
            criptoAbrev:
                ref.watch(fromCryptoConvertAbrev.state).state.toUpperCase(),
            criptoQtdWallet:
                double.parse(ref.watch(fieldTransferValue.state).state),
            text: "Converter",
          ),
          ItemDetail(
            option: 3,
            criptoAbrev:
                ref.watch(toCryptoConvertAbrev.state).state.toUpperCase(),
            criptoQtdWallet: ref.watch(resultConvertedValue.state).state,
            text: "Receber",
          ),
          ItemDetail(
            option: 5,
            criptoAbrev:
                ref.watch(fromCryptoConvertAbrev.state).state.toUpperCase(),
            criptoAbrevTo:
                ref.watch(toCryptoConvertAbrev.state).state.toUpperCase(),
            criptoQtdWallet: ref.watch(toCryptoCotacaoProvider.state).state,
            text: "Receber",
          ),
          const ConfirmReviewButton()
        ],
      ),
    );
  }
}
