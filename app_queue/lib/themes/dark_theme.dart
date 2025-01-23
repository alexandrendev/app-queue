import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.light(
      brightness: Brightness.dark,
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade300,
    ),
    textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.grey[300],
          displayColor: Colors.black,
        ));