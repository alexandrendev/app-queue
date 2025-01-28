import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  final double heigth;

  const MyLogo({
    super.key,
    required this.heigth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Ícone do Sistema
        ClipRRect(
          child: Image.asset(
            'lib/assets/images/logo.png',
            height: heigth,
          ),
        ),
        //Espaço embranco
        // const SizedBox(height: heig),
        //Nome do Aplicativo
        // const Text(
        //   'PS Queue',
        //   style: TextStyle(fontSize: 20),
        // ),
        //Espaço em branco
        // const SizedBox(height: 25),
      ],
    );
  }
}
