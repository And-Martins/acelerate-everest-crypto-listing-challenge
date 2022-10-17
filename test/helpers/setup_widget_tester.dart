import 'package:crypto_listing/l10n/translation_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SetupWidgetTester extends StatelessWidget {
  final Widget child;
  const SetupWidgetTester({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        supportedLocales: TranslationFile.supportedLocales,
        localizationsDelegates: TranslationFile.localizationsDelegates,
        home: Material(
          child: MediaQuery(
            data: const MediaQueryData(),
            child: child,
          ),
        ),
      ),
    );
  }
}

Future<void> loadPage(WidgetTester tester, Widget child) async {
  var testedWidget = SetupWidgetTester(
    child: child,
  );
  await tester.pumpWidget(testedWidget);
}
