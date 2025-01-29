// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Color(0xFFF5F5F5),
    primary: Color(0xFFD32F2F),
    secondary: Color(0xFFFFCDD2),
    inversePrimary: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
  ),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: Colors.black,
        displayColor: Colors.grey.shade800,
      ),
  iconTheme: IconThemeData(
    color: Color(0xFFD32F2F),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFFD32F2F),
    unselectedItemColor: Colors.grey.shade600,
    backgroundColor: Color(0xFFFFFFFF),
  ),
);
