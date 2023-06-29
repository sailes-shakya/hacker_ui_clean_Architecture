import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackernews/core/constant/color_constant.dart';
import 'package:hackernews/di/injection_container.dart';
import 'package:hackernews/router/router_import.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Hacker News",
      theme: _buildTheme(),
      routerConfig: AppRouter().config(),
    );
  }
}

ThemeData _buildTheme() {
  final baseTheme = ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(color: ColorConst.primaryColor),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: ColorConst.secondaryColor,
    ),
  );
  return baseTheme.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
  );
}
