// ignore_for_file: avoid_print
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hackernews/app/search/presentation/pages/dashboard_screen.dart';
import 'package:hackernews/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets(
    "ui",
    ($) async {
      app.main();
      await $.pump();

      await waitFor($, (DashBoradScreen));

      await $.pumpAndSettle();
      await $.pumpAndSettle();

      expect(find.byKey(const Key("searchBox")), findsOneWidget);

      await $.enterText(find.byKey(const Key("searchBox")), "iphone");
      await $.pumpAndSettle();
    },
  );
}

Future<void> waitFor(WidgetTester widgetTester, Type type) async {
  int i = 0;
  while (!findsOneWidget.matches(find.byType(type), {})) {
    await widgetTester.pump(Duration(seconds: 1));
    if (i >= 50) break;
    i++;
  }
}
