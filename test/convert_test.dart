import 'dart:io';

import 'package:crypto_listing/convert/controller/providers.dart';
import 'package:crypto_listing/convert/view/convert_screen.dart';
import 'package:crypto_listing/shared/providers/providers.dart';
import 'package:crypto_listing/wallet/controller/crypto_provider.dart';
import 'package:crypto_listing/wallet/model/crypto_list_view_data.dart';
import 'package:crypto_listing/wallet/model/crypto_view_data.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);

  testWidgets(
    'WHEN loading Wallet THEN ensure widgets are showing load progress indicator',
    (WidgetTester tester) async {
      await loadPage(
        tester,
        ProviderScope(overrides: [
          fromCryptoCotacaoProvider
              .overrideWithValue(StateController(39856.00)),
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
                  CryptoViewData(
                      currentPrice: 100663,
                      id: 'ethereum',
                      image:
                          'https://assets.coingecko.com/coins/images/279/small/ethereum.png?1595348880',
                      marketCapChangePercentage24h: -0.63286,
                      name: 'Ethereum',
                      symbol: 'eth'),
                ],
              ),
            ),
          ),
          cryptoQtdWalletCriptoProvider
              .overrideWithValue(StateController(0.84)),
          fromCryptoConvertAbrev.overrideWithValue(StateController('eth')),
          fromCryptoConvertImg.overrideWithValue(StateController(
              'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579')),
          convertedValue
              .overrideWithValue(StateController(Decimal.parse('0.924'))),
        ], child: const ConvertScreen()),
      );
      expect(
          find.byKey(const Key('quantityConvertBodyScreen')), findsOneWidget);
      expect(find.byKey(const Key('defaultTitleConvertBodyScreen')),
          findsOneWidget);
      await tester.enterText(find.byType(TextFormField), '3.9');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(find.byType(TextFormField), '0.083');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.tap(find.byKey(const Key('confirmButtonConvertScreen')));
      await tester.tap(find.byKey(const Key('dropdownFromConvert')));
    },
  );
  testWidgets(
    'WHEN selected the last crypto in Wallet THEN ensure the dropdown will show the last crypto',
    (WidgetTester tester) async {
      await loadPage(
        tester,
        ProviderScope(
          overrides: [
            fromCryptoCotacaoProvider
                .overrideWithValue(StateController(39856.00)),
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
                    CryptoViewData(
                        currentPrice: 100663,
                        id: 'ethereum',
                        image:
                            'https://assets.coingecko.com/coins/images/279/small/ethereum.png?1595348880',
                        marketCapChangePercentage24h: -0.63286,
                        name: 'Ethereum',
                        symbol: 'eth'),
                  ],
                ),
              ),
            ),
            cryptoQtdWalletCriptoProvider
                .overrideWithValue(StateController(0.84)),
            fromCryptoConvertAbrev.overrideWithValue(StateController('btc')),
            fromCryptoConvertImg.overrideWithValue(StateController(
                'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579')),
            convertedValue
                .overrideWithValue(StateController(Decimal.parse('0.924'))),
          ],
          child: const ConvertScreen(),
        ),
      );

      final dropdown = find.byKey(const Key('dropdownFromConvert'));
      await tester.tap(dropdown);
      await tester.pump();

      await tester.tap(dropdown.last);
      await tester.pump();
    },
  );

  testWidgets(
    'WHEN confirm button in review are pressed THEN ensure widgets are showing message',
    (WidgetTester tester) async {
      await loadPage(
        tester,
        ProviderScope(overrides: [
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
                  CryptoViewData(
                      currentPrice: 100663,
                      id: 'ethereum',
                      image:
                          'https://assets.coingecko.com/coins/images/279/small/ethereum.png?1595348880',
                      marketCapChangePercentage24h: -0.63286,
                      name: 'Ethereum',
                      symbol: 'eth'),
                ],
              ),
            ),
          ),
          fieldTransferValue.overrideWithValue(StateController("0")),
        ], child: const ConvertScreen()),
      );

      await tester.tap(find.byKey(const Key('confirmButtonConvertScreen')));
      await tester.pump(const Duration(seconds: 3));
      expect(find.byType(SnackBar), findsOneWidget);

      fieldTransferValue.overrideWithValue(StateController("10"));
      await tester.tap(find.byKey(const Key('confirmButtonConvertScreen')));
    },
  );
}
