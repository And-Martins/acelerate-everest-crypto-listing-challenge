import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'helpers/detail_screen_providers_test.dart';

void main() {
  
  testWidgets(
    'WHEN load SetupProviders THEN ensure watch all providers',
    (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: DetailScreenProvidersTest(),
          ),
        ),
      );

      await tester.pump(const Duration(seconds: 4));
      await tester.pump(const Duration(seconds: 4));
    },
  );
}
