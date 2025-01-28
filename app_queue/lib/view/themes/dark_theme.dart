import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.red.shade400,
    secondary: Colors.red.shade200,
    inversePrimary: Colors.black,
    onPrimary: Colors.grey.shade700,
    onSecondary: Colors.black,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Colors.white,
      ),
  iconTheme: IconThemeData(
    color: Colors.red.shade200,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.red.shade400,
    unselectedItemColor: Colors.grey.shade600,
    backgroundColor: Colors.grey.shade900,
  ),
);
