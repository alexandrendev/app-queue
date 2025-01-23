import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: Colors.red.shade400,
    secondary: Colors.red.shade200,
    inversePrimary: Colors.white, // Contraste inverso para elementos escuros
    onPrimary: Colors.white,
    onSecondary: Colors.white,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.black,
      ),
  iconTheme: IconThemeData(
    color: Colors.red.shade400,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.red.shade400,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
);
