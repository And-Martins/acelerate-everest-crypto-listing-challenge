import 'dart:io';

import 'package:crypto_listing/confirmation/view/confirm_screen.dart';
import 'package:crypto_listing/convert/controller/providers.dart';
import 'package:crypto_listing/convert/view/convert_screen.dart';
import 'package:crypto_listing/cripto_details/controller/providers.dart';
import 'package:crypto_listing/cripto_details/model/detail_list_view_data.dart';
import 'package:crypto_listing/cripto_details/view/detail_screen.dart';
import 'package:crypto_listing/review/view/review_page.dart';
import 'package:crypto_listing/shared/providers/providers.dart';
import 'package:crypto_listing/transactions/model/transaction_model.dart';
import 'package:crypto_listing/transactions/providers/transaction_providers.dart';
import 'package:crypto_listing/transactions/view/transactions_screen.dart';
import 'package:crypto_listing/wallet/controller/crypto_provider.dart';
import 'package:crypto_listing/wallet/model/crypto_list_view_data.dart';
import 'package:crypto_listing/wallet/model/crypto_view_data.dart';
import 'package:crypto_listing/wallet/view/wallet_screen.dart';
import 'package:crypto_listing/wallet/widgets/wallet_body.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  group(
    'Testing Wallet Screen',
    () {
      testWidgets(
        'WHEN loading Wallet THEN ensure widgets are showing load progress indicator',
        (WidgetTester tester) async {
          await loadPage(tester, const WalletBody());
          expect(find.byKey(const Key('loadingHeaderWallet')), findsOneWidget);
          expect(
              find.byKey(const Key('loadingListViewWallet')), findsOneWidget);
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
                    return Provider(
                        (ref) => AsyncValue.data(Decimal.parse('39856.00')));
                  },
                ),
                listCryptoProvider.overrideWithValue(
                  AsyncValue.data(
                    CryptoListViewData(
                      cryptoViewDataList: [
                        CryptoViewData(
                            currentPrice: Decimal.parse('100663'),
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
          expect(
              find.byKey(const Key('totalValueWalletScreen')), findsOneWidget);
          expect(find.byKey(const Key('subtitleWalletScreen')), findsOneWidget);
          expect(find.byKey(const Key('listviewCrypto')), findsOneWidget);
          await tester.dragUntilVisible(find.text('BTC'),
              find.byKey(const Key('listviewCrypto')), const Offset(0, -250));
          await tester.tap(find.byKey(const Key('hideButtonWalletScreen')));
          await tester.tap(find.byKey(const Key('criptoItemWalletScreen')));
        },
      );
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
                    currentPrice: Decimal.parse('100663'),
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
          ],
          child: const DetailScreen(),
        ),
      );

      expect(find.byKey(const Key('defaultTitleDetailScreen')), findsOneWidget);
      await tester.tap(find.text('5D'));
      await tester.tap(find.text('15D'));
      await tester.tap(find.text('30D'));
      await tester.tap(find.text('45D'));
      await tester.tap(find.text('90D'));
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
                  currentPrice: Decimal.parse('100663'),
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
                      currentPrice: Decimal.parse('100663'),
                      id: 'bitcoin',
                      image:
                          'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
                      marketCapChangePercentage24h: -0.63286,
                      name: 'Bitcoin',
                      symbol: 'btc'),
                  CryptoViewData(
                      currentPrice: Decimal.parse('100663'),
                      id: 'ethereum',
                      image:
                          'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
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
    },
  );
  // testWidgets(
  //   'WHEN the last cryptocoin in dropodown is selected THEN ensure widgets are showing load progress indicator',
  //   (WidgetTester tester) async {
  //     await loadPage(
  //       tester,
  //       ProviderScope(overrides: [
  //         fromCryptoCotacaoProvider
  //             .overrideWithValue(StateController(39856.00)),
  //         listCryptoProvider.overrideWithValue(
  //           AsyncValue.data(
  //             CryptoListViewData(
  //               cryptoViewDataList: [
  //                 CryptoViewData(
  //                     currentPrice: Decimal.parse('100663'),
  //                     id: 'bitcoin',
  //                     image:
  //                         'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
  //                     marketCapChangePercentage24h: -0.63286,
  //                     name: 'Bitcoin',
  //                     symbol: 'btc'),
  //                 CryptoViewData(
  //                     currentPrice: Decimal.parse('100663'),
  //                     id: 'ethereum',
  //                     image:
  //                         'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
  //                     marketCapChangePercentage24h: -0.63286,
  //                     name: 'Ethereum',
  //                     symbol: 'eth'),
  //               ],
  //             ),
  //           ),
  //         ),
  //         cryptoQtdWalletCriptoProvider
  //             .overrideWithValue(StateController(0.84)),
  //         fromCryptoConvertAbrev.overrideWithValue(StateController('eth')),
  //         fromCryptoConvertImg.overrideWithValue(StateController(
  //             'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579')),
  //         convertedValue
  //             .overrideWithValue(StateController(Decimal.parse('0.924'))),
  //       ], child: const ConvertScreen()),
  //     );
  //     expect(
  //         find.byKey(const Key('quantityConvertBodyScreen')), findsOneWidget);
  //     expect(find.byKey(const Key('defaultTitleConvertBodyScreen')),
  //         findsOneWidget);
  //     await tester.enterText(find.byType(TextFormField), '3.9');
  //     await tester.testTextInput.receiveAction(TextInputAction.done);
  //     await tester.enterText(find.byType(TextFormField), '0.083');
  //     await tester.testTextInput.receiveAction(TextInputAction.done);
  //     await tester.tap(find.byKey(const Key('confirmButtonConvertScreen')));
  //   },
  // );
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
                      currentPrice: Decimal.parse('100663'),
                      id: 'bitcoin',
                      image:
                          'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
                      marketCapChangePercentage24h: -0.63286,
                      name: 'Bitcoin',
                      symbol: 'btc'),
                  CryptoViewData(
                      currentPrice: Decimal.parse('100663'),
                      id: 'ethereum',
                      image:
                          'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
                      marketCapChangePercentage24h: -0.63286,
                      name: 'Ethereum',
                      symbol: 'eth'),
                ],
              ),
            ),
          ),
          fieldTransferValue.overrideWithValue(StateController("")),
        ], child: const ConvertScreen()),
      );

      await tester.tap(find.byKey(const Key('confirmButtonConvertScreen')));
    },
  );
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
    },
  );
  testWidgets(
    'WHEN loading Confirm Screen THEN ensure widgets are not null',
    (WidgetTester tester) async {
      await loadPage(tester, const ConfirmScreen());
      expect(find.byKey(const Key('animtaionConfirmScreen')), findsOneWidget);
      expect(
          find.byKey(const Key('defaultTitleConfirmScreen')), findsOneWidget);
      await tester.tap(find.byKey(const Key('backButtonConfirmScreen')));
    },
  );
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
