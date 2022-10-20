import 'package:crypto_listing/l10n/translation_file.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InternationalizationTester extends ConsumerWidget {
  final Widget child;
  final Locale locale;

  const InternationalizationTester(
      {required this.child, required this.locale, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Material(
        child: child,
      ),
      localizationsDelegates: TranslationFile.localizationsDelegates,
      supportedLocales: TranslationFile.supportedLocales,
      locale: locale,
    );
  }
}
