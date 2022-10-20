import 'package:crypto_listing/transactions/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


import '../../convert/controller/providers.dart';

import '../../l10n/translation_file.dart';
import '../../shared/providers/providers.dart';
import '../../transactions/providers/transaction_providers.dart';

class ConfirmReviewButton extends HookConsumerWidget {
  const ConfirmReviewButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
          onPressed: () {
            DateTime now = DateTime.now();
            DateTime date = DateTime(now.year, now.month, now.day);
            TransactionModel transactionModel = TransactionModel(
              date: date,
              fromCryptoQtd:
                  double.parse(ref.watch(fieldTransferValue.state).state),
              fromCryptoAbrev: ref.watch(fromCryptoConvertAbrev.state).state,
              toCryptoQtd: ref.watch(resultConvertedValue.state).state,
              toCryptoAbrev: ref.watch(toCryptoConvertAbrev.state).state,
              valueReais: ref.watch(transferCryptoConverted.state).state,
            );

            ref.watch(transactionsProvider.state).state.add(transactionModel);

            Navigator.pushNamed(
              context,
              '/completeConversion',
            );
          },
          child: Text(
            TranslationFile.of(context)!.reviewButton,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
