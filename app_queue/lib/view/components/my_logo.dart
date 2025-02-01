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
      ],
    );
  }
}
