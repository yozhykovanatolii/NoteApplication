import 'package:flutter/material.dart';

abstract class AppTheme {
  static const TextStyle _style = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static ThemeData setTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          fontSize: 23,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      searchBarTheme: const SearchBarThemeData(
        shadowColor: WidgetStatePropertyAll(Colors.blue),
      ),
      textTheme: const TextTheme(
        titleMedium: _style,
        bodyMedium: _style,
        bodySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        labelSmall: TextStyle(fontSize: 14),
        displayMedium: TextStyle(fontSize: 20),
      ),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
    );
  }
}
