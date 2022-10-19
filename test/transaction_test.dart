import 'dart:io';

import 'package:crypto_listing/transactions/model/transaction_model.dart';
import 'package:crypto_listing/transactions/providers/transaction_providers.dart';
import 'package:crypto_listing/transactions/view/transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);

  testWidgets(
    'WHEN loading Transactions Screen THEN ensure widgets are not null',
    (WidgetTester tester) async {
      await loadPage(
        tester,
        ProviderScope(overrides: [
          transactionsProvider.overrideWithValue(
            StateController(
              [
                TransactionModel(
                  date: DateTime(2022, 10, 17),
                  fromCryptoAbrev: 'btc',
                  toCryptoAbrev: 'eth',
                  fromCryptoQtd: 0.0891,
                  toCryptoQtd: 0.9852,
                  valueReais: 2500,
                ),
              ],
            ),
          ),
        ], child: const TransactionsScreen()),
      );
      expect(find.byKey(const Key('transactionFirstLine')), findsOneWidget);
      expect(find.byKey(const Key('transactionSecoundLine')), findsOneWidget);
      expect(find.byKey(const Key('transactionDate')), findsOneWidget);
      expect(find.byKey(const Key('transactionValue')), findsOneWidget);
    },
  );
  testWidgets(
    'WHEN loading Transactions Screen THEN dont have transactions',
    (WidgetTester tester) async {
      await loadPage(
        tester,
        const TransactionsScreen(),
      );
      expect(
          find.byKey(const Key('animationWithoutTransaction')), findsOneWidget);
      expect(find.byKey(const Key('defaultTitleTransactionScreen')),
          findsOneWidget);
      expect(find.byKey(const Key('defaultSubtitleTransactionScreen')),
          findsOneWidget);
    },
  );
}
