import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'core/routes.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<String> listLocale = Platform.localeName.split('_');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      supportedLocales: TranslationFile.supportedLocales,
      localizationsDelegates: TranslationFile.localizationsDelegates,
      initialRoute: '/wallet',
      routes: routesNavigation,
    );
  }
}
