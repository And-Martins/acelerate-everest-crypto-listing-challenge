import 'package:crypto_listing/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('WHEN Wallet is Called', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    expect(find.byKey(const Key('loadingListViewWallet')), findsOneWidget);
    await tester.pump(const Duration(seconds: 4));

    // expect(find.byType(CriptoItem), findsAtLeastNWidgets(1));
    // await tester.tap(find.byTooltip('Loading1'));
    // expect(find.text('BTC'), findsOneWidget);
    // expect(find.text('Bitcoin'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byWidget(CriptoItem));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
