import 'package:flutter/material.dart';
import 'analysis/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ColorScheme appThemeColors = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 250, 220, 60),
    brightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: appThemeColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: appThemeColors,
        useMaterial3: true,
      ),
      home: const Analysis(),
    );
  }
}
