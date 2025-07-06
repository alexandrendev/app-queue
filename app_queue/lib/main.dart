import 'package:app_queue/core/logger.dart';
import 'package:app_queue/db/connection_b4a.dart';
import 'package:app_queue/view/pages/cadastro_usuario.dart';
import 'package:app_queue/view/pages/fichaList.dart';
import 'package:app_queue/view/pages/init_page.dart';
import 'package:app_queue/view/pages/login_page.dart';
import 'package:app_queue/view/themes/dark_theme.dart';
import 'package:app_queue/view/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Captura erros globais
  FlutterError.onError = (FlutterErrorDetails details) {
    AppLogger.error('Flutter Error: ${details.exception}', 'Main');
  };

  runZonedGuarded(() async {
    final b4app = B4App();
    final success = await b4app.initParse();
    
    if (!success) {
      AppLogger.error('Falha na inicialização do Parse', 'Main');
    }

    runApp(const MyApp());
  }, (error, stack) {
    AppLogger.error('Uncaught Error: $error', 'Main');
  });
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
        home: LoginPage(),
        routes: {
          '/cadastro': (context) => CadastroUsuario(),
          '/login': (context) => LoginPage(),
          '/initial': (context) => const InitalPage(),
          '/home': (context) => FichaListScreen(),
        });
  }
}
