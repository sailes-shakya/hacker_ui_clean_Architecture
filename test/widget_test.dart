// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hackernews/app/search/presentation/pages/dashboard_screen.dart';

void main() {
  testWidgets('test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: const DashBoradScreen()));

    // Verify that our counter starts at 0.
    expect(find.byKey(const Key("searchBox")), findsOneWidget);
    tester.enterText(find.byKey(const Key("searchBox")), "new");

    expect(find.text('new'), findsOneWidget);
    // Tap the '+' icon and trigger a frame.

    await tester.pump();

    // Verify that our counter has incremented.
  });
}
