import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.deepOrange;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primary,
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 5,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
      ),
    ),
  );
}
