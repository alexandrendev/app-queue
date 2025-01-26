import 'package:app_queue/db/connection_b4a.dart';
import 'package:app_queue/pages/init_page.dart';
import 'package:app_queue/themes/dark_theme.dart';
import 'package:app_queue/themes/light_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isInitialized = await initB4A();

  if (!isInitialized) {
    throw Exception('B4A not initialized');
  } else {
    print('B4A initialized');
  }
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
    );
  }
}
