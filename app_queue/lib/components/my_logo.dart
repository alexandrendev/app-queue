import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Ícone do Sistema
        ClipRRect(
          child: Image.asset(
            'lib/assets/images/logo.png',
            height: 80,
          ),
        ),
        //Espaço embranco
        const SizedBox(height: 5),
        //Nome do Aplicativo
        const Text(
          'PS Queue',
          style: TextStyle(fontSize: 20),
        ),
        //Espaço em branco
        const SizedBox(height: 25),
      ],
    );
  }
}