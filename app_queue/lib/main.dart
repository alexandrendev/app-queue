import 'package:app_queue/db/connection_b4a.dart';
import 'package:app_queue/view/pages/cadastro_usuario.dart';
import 'package:app_queue/view/pages/fichaList.dart';
import 'package:app_queue/view/pages/init_page.dart';
import 'package:app_queue/view/pages/login_page.dart';
import 'package:app_queue/view/themes/dark_theme.dart';
import 'package:app_queue/view/themes/light_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  B4App().initParse();

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
          '/cadastro': (context) => CadastroUsuario(),
          '/login': (context) => LoginPage(),
          '/initial': (context) => const InitalPage(),
        });
  }
}
