import 'dart:io';

import 'package:crypto_listing/confirmation/view/confirm_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/setup_widget_tester.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);

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
}
