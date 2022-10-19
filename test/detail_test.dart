import 'dart:io';

import 'package:crypto_listing/cripto_details/controller/providers.dart';
import 'package:crypto_listing/cripto_details/model/detail_list_view_data.dart';
import 'package:crypto_listing/cripto_details/view/detail_screen.dart';
import 'package:crypto_listing/cripto_details/widgets/button_day.dart';
import 'package:crypto_listing/shared/providers/providers.dart';
import 'package:crypto_listing/wallet/model/crypto_view_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  testWidgets(
    'WHEN loading Detail THEN ensure widgets have information',
    (WidgetTester tester) async {
      await loadPage(
        tester,
        ProviderScope(
          overrides: [
            cryptoDataProvider.overrideWithValue(
              StateController(
                CryptoViewData(
                    id: 'bitcoin',
                    symbol: 'btc',
                    name: 'Bitcoin',
                    image:
                        'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
                    currentPrice: 100663,
                    marketCapChangePercentage24h: -0.63286),
              ),
            ),
            getDetailProvider.overrideWithProvider(
              (argument) {
                return Provider(
                  (ref) => AsyncValue.data(
                    DetailListViewData(
                      prices: const [
                        [00.1, 0.3],
                        [00.2, 0.4],
                        [00.3, 0.3],
                        [00.4, 0.4],
                        [00.5, 0.3],
                        [00.6, 0.4],
                        [00.7, 0.5],
                        [00.8, 0.7],
                        [00.9, 0.7],
                        [00.10, 0.7],
                        [00.11, 0.3],
                        [00.12, 0.4],
                        [00.13, 0.3],
                        [00.14, 0.4],
                        [00.15, 0.3],
                        [00.16, 0.4],
                        [00.17, 0.5],
                        [00.18, 0.7],
                        [00.19, 0.7],
                        [00.20, 0.7],
                        [00.21, 0.3],
                        [00.22, 0.4],
                        [00.23, 0.3],
                        [00.24, 0.4],
                        [00.25, 0.3],
                        [00.26, 0.4],
                        [00.27, 0.5],
                        [00.28, 0.7],
                        [00.29, 0.7],
                        [00.30, 0.7],
                        [00.31, 0.3],
                        [00.32, 0.4],
                        [00.33, 0.3],
                        [00.34, 0.4],
                        [00.35, 0.3],
                        [00.36, 0.4],
                        [00.37, 0.5],
                        [00.38, 0.7],
                        [00.39, 0.7],
                        [00.40, 0.7],
                        [00.41, 0.3],
                        [00.42, 0.4],
                        [00.43, 0.3],
                        [00.44, 0.4],
                        [00.45, 0.3],
                        [00.46, 0.4],
                        [00.47, 0.5],
                        [00.48, 0.7],
                        [00.49, 0.7],
                        [00.50, 0.7],
                        [00.51, 0.3],
                        [00.52, 0.4],
                        [00.53, 0.3],
                        [00.54, 0.4],
                        [00.55, 0.3],
                        [00.56, 0.4],
                        [00.57, 0.5],
                        [00.58, 0.7],
                        [00.59, 0.7],
                        [00.60, 0.7],
                        [00.61, 0.3],
                        [00.62, 0.4],
                        [00.63, 0.3],
                        [00.64, 0.4],
                        [00.65, 0.3],
                        [00.66, 0.4],
                        [00.67, 0.5],
                        [00.68, 0.7],
                        [00.69, 0.7],
                        [00.70, 0.7],
                        [00.71, 0.3],
                        [00.72, 0.4],
                        [00.73, 0.3],
                        [00.74, 0.4],
                        [00.75, 0.3],
                        [00.76, 0.4],
                        [00.77, 0.5],
                        [00.78, 0.7],
                        [00.79, 0.7],
                        [00.80, 0.7],
                        [00.81, 0.3],
                        [00.82, 0.4],
                        [00.83, 0.3],
                        [00.84, 0.4],
                        [00.85, 0.3],
                        [00.86, 0.4],
                        [00.87, 0.5],
                        [00.88, 0.7],
                        [00.89, 0.7],
                        [00.90, 0.7],
                      ],
                    ),
                  ),
                );
              },
            ),
            cryptoDaysProvider.overrideWithValue(StateController(5)),
          ],
          child: const DetailScreen(),
        ),
      );

      expect(find.byKey(const Key('defaultTitleDetailScreen')), findsOneWidget);
      var criptoDaySelected = tester.widget<ButtonDay>(
        find.widgetWithText(ButtonDay, '5D'),
      );
      await tester.tap(find.text('5D'));
      await tester.pump(const Duration(seconds: 2));
      expect(criptoDaySelected.days, equals(5));

      await tester.tap(find.text('15D'));
      await tester.pump(const Duration(seconds: 2));
      expect(criptoDaySelected.days, equals(5));

      await tester.tap(find.byKey(const Key('convertButtonDetailScreen')));
    },
  );
  testWidgets(
    'WHEN loading Detail THEN ensure widgets have information',
    (WidgetTester tester) async {
      await loadPage(
        tester,
        ProviderScope(
          overrides: [
            cryptoDataProvider.overrideWithValue(
              StateController(
                CryptoViewData(
                  id: 'bitcoin',
                  symbol: 'btc',
                  name: 'Bitcoin',
                  image:
                      'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
                  currentPrice: 100663,
                  marketCapChangePercentage24h: 0.63286,
                ),
              ),
            ),
            getDetailProvider.overrideWithProvider(
              (argument) {
                return Provider(
                  (ref) => AsyncValue.data(
                    DetailListViewData(
                      prices: const [
                        [00.1, 0.3],
                        [00.2, 0.4],
                        [00.3, 0.3],
                        [00.4, 0.4],
                        [00.5, 0.3],
                        [00.6, 0.4],
                        [00.7, 0.5],
                        [00.8, 0.7],
                        [00.9, 0.7],
                        [00.10, 0.7],
                        [00.11, 0.3],
                        [00.12, 0.4],
                        [00.13, 0.3],
                        [00.14, 0.4],
                        [00.15, 0.3],
                        [00.16, 0.4],
                        [00.17, 0.5],
                        [00.18, 0.7],
                        [00.19, 0.7],
                        [00.20, 0.7],
                        [00.21, 0.3],
                        [00.22, 0.4],
                        [00.23, 0.3],
                        [00.24, 0.4],
                        [00.25, 0.3],
                        [00.26, 0.4],
                        [00.27, 0.5],
                        [00.28, 0.7],
                        [00.29, 0.7],
                        [00.30, 0.7],
                        [00.31, 0.3],
                        [00.32, 0.4],
                        [00.33, 0.3],
                        [00.34, 0.4],
                        [00.35, 0.3],
                        [00.36, 0.4],
                        [00.37, 0.5],
                        [00.38, 0.7],
                        [00.39, 0.7],
                        [00.40, 0.7],
                        [00.41, 0.3],
                        [00.42, 0.4],
                        [00.43, 0.3],
                        [00.44, 0.4],
                        [00.45, 0.3],
                        [00.46, 0.4],
                        [00.47, 0.5],
                        [00.48, 0.7],
                        [00.49, 0.7],
                        [00.50, 0.7],
                        [00.51, 0.3],
                        [00.52, 0.4],
                        [00.53, 0.3],
                        [00.54, 0.4],
                        [00.55, 0.3],
                        [00.56, 0.4],
                        [00.57, 0.5],
                        [00.58, 0.7],
                        [00.59, 0.7],
                        [00.60, 0.7],
                        [00.61, 0.3],
                        [00.62, 0.4],
                        [00.63, 0.3],
                        [00.64, 0.4],
                        [00.65, 0.3],
                        [00.66, 0.4],
                        [00.67, 0.5],
                        [00.68, 0.7],
                        [00.69, 0.7],
                        [00.70, 0.7],
                        [00.71, 0.3],
                        [00.72, 0.4],
                        [00.73, 0.3],
                        [00.74, 0.4],
                        [00.75, 0.3],
                        [00.76, 0.4],
                        [00.77, 0.5],
                        [00.78, 0.7],
                        [00.79, 0.7],
                        [00.80, 0.7],
                        [00.81, 0.3],
                        [00.82, 0.4],
                        [00.83, 0.3],
                        [00.84, 0.4],
                        [00.85, 0.3],
                        [00.86, 0.4],
                        [00.87, 0.5],
                        [00.88, 0.7],
                        [00.89, 0.7],
                        [00.90, 0.7],
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
          child: const DetailScreen(),
        ),
      );

      expect(find.byKey(const Key('defaultTitleDetailScreen')), findsOneWidget);
      await tester.tap(find.byKey(const Key('convertButtonDetailScreen')));
    },
  );
}
