import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/internationalization_tester.dart';
import '../helpers/setup_languages_test.dart';

void main() {
  testWidgets(
    'testing internalization with english language',
    (tester) async {
      await tester.pumpWidget(
        const InternationalizationTester(
          locale: Locale('en', 'US'),
          child: SetupLanguagesTest(),
        ),
      );
      expect(find.text('English'), findsOneWidget);
      expect(find.text('Transactions'), findsOneWidget);
    },
  );
}
