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
          locale: Locale('pt', 'BR'),
          child: SetupLanguagesTest(),
        ),
      );
      expect(find.text('Português'), findsOneWidget);
      expect(find.text('Movimentações'), findsOneWidget);
    },
  );
}
