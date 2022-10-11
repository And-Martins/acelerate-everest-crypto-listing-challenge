import 'dart:io';

import 'package:crypto_listing/wallet/controller/crypto_provider.dart';
import 'package:crypto_listing/wallet/view/wallet_screen.dart';
import 'package:crypto_listing/wallet/widgets/wallet_body.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  group('Testing Wallet Screen', () {
    testWidgets(
        'WHEN loading Wallet THEN ensure widgets are showing load progress indicator',
        (WidgetTester tester) async {
      await loadPage(tester, const WalletBody());
      expect(find.byKey(const Key('loadingHeaderWallet')), findsOneWidget);
      expect(find.byKey(const Key('loadingListViewWallet')), findsOneWidget);
      await tester.pump(const Duration(seconds: 4));
    });

    testWidgets("WHEN data is load in Wallet ensure that content is not null",
        (WidgetTester tester) async {
      await loadPage(
          tester,
          ProviderScope(overrides: [
            getTotalWalletValue.overrideWithProvider((argument) =>
                Provider((ref) => AsyncValue.data(Decimal.parse('39856.00'))))
          ], child: const WalletScreen()));
      await tester.pump(const Duration(seconds: 4));
      expect(find.byKey(const Key('titleWalletScreen')), findsOneWidget);
      expect(find.byKey(const Key('totalValueWalletScreen')), findsOneWidget);
      expect(find.byKey(const Key('subtitleWalletScreen')), findsOneWidget);
      // await tester.dragUntilVisible(find.byElementType(ListView),
      //     find.text('BTC'), const Offset(0, -250));
    });
    // expect(find.byKey(const Key('titleWalletScreen')), findsOneWidget);
    // expect(find.byKey(const Key('totalValueWalletScreen')), findsOneWidget);
    // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byWidget(CriptoItem));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
