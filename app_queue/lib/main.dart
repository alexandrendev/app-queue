import 'package:app_queue/pages/home_atendente.dart';
import 'package:app_queue/pages/init_page.dart';
import 'package:app_queue/pages/login_page.dart';
import 'package:app_queue/themes/dark_theme.dart';
import 'package:app_queue/themes/light_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: InitalPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/atendente': (context) => HomeAtendente(),
      },
    );
  }
}
