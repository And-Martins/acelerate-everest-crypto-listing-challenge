import 'dart:io';

import 'package:crypto_listing/convert/controller/providers.dart';
import 'package:crypto_listing/review/view/review_page.dart';
import 'package:crypto_listing/shared/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);

  testWidgets(
    'WHEN loading review THEN ensure widgets are not null',
    (WidgetTester tester) async {
      await loadPage(
        tester,
        ProviderScope(
          overrides: [
            fromCryptoConvertAbrev.overrideWithValue(StateController('btc')),
            toCryptoConvertAbrev.overrideWithValue(StateController('eth')),
            resultConvertedValue.overrideWithValue(StateController(0.956)),
            toCryptoCotacaoProvider.overrideWithValue(StateController(0.8330)),
            fieldTransferValue.overrideWithValue(StateController("0.0835")),
            transferCryptoConverted.overrideWithValue(StateController(5500)),
          ],
          child: const ReviewPage(),
        ),
      );
      expect(find.byKey(const Key('defaultTitleReviewScreen')), findsOneWidget);
      await tester.press(find.byKey(const Key('confirmButtonReviewScreen')));
      await tester.pumpAndSettle(const Duration(seconds: 2));
    },
  );
}
