import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Color(0xFF121212),
    primary: Color(0xFFE53935),
    secondary: Color(0xFFEF9A9A),
    inversePrimary: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.black,
      ),
  iconTheme: IconThemeData(
    color: Color(0xFFEF9A9A),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFFE53935),
    unselectedItemColor: Colors.grey.shade500,
    backgroundColor: Color(0xFF1E1E1E),
  ),
);
