import 'dart:io';

import 'package:crypto_listing/wallet/controller/crypto_provider.dart';
import 'package:crypto_listing/wallet/model/crypto_list_view_data.dart';
import 'package:crypto_listing/wallet/model/crypto_view_data.dart';
import 'package:crypto_listing/wallet/view/wallet_screen.dart';
import 'package:crypto_listing/wallet/widgets/wallet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);

  testWidgets(
    'WHEN loading Wallet THEN ensure widgets are showing load progress indicator',
    (WidgetTester tester) async {
      await loadPage(tester, const WalletBody());
      expect(find.byKey(const Key('loadingHeaderWallet')), findsOneWidget);
      expect(find.byKey(const Key('loadingListViewWallet')), findsOneWidget);
      await tester.pump(const Duration(seconds: 4));
    },
  );

  testWidgets(
    "WHEN data is load in Wallet ensure that content is not null",
    (WidgetTester tester) async {
      await loadPage(
        tester,
        ProviderScope(
          overrides: [
            getTotalWalletValue.overrideWithProvider(
              (argument) {
                return Provider((ref) => const AsyncValue.data(39856.00));
              },
            ),
            listCryptoProvider.overrideWithValue(
              AsyncValue.data(
                CryptoListViewData(
                  cryptoViewDataList: [
                    CryptoViewData(
                        currentPrice: 100663,
                        id: 'bitcoin',
                        image:
                            'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
                        marketCapChangePercentage24h: -0.63286,
                        name: 'Bitcoin',
                        symbol: 'btc'),
                  ],
                ),
              ),
            ),
          ],
          child: const WalletScreen(),
        ),
      );
      await tester.pump(const Duration(seconds: 4));
      expect(find.byKey(const Key('titleWalletScreen')), findsOneWidget);
      expect(find.byKey(const Key('totalValueWalletScreen')), findsOneWidget);
      expect(find.byKey(const Key('subtitleWalletScreen')), findsOneWidget);
      expect(find.byKey(const Key('listviewCrypto')), findsOneWidget);
      await tester.dragUntilVisible(find.text('BTC'),
          find.byKey(const Key('listviewCrypto')), const Offset(0, -250));
      await tester.tap(find.byKey(const Key('hideButtonWalletScreen')));
      await tester.tap(find.byKey(const Key('criptoItemWalletScreen')));
    },
  );
}
