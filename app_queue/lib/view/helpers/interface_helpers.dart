import 'package:app_queue/view/components/my_button.dart';
import 'package:flutter/material.dart';

void displayDialog(
    BuildContext context, String mensagem, String titulo, Function()? onTap) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Text(
        titulo,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      content: Text(
        mensagem,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: [
        MyButton(
          buttonText: 'Ok',
          onTapButton: onTap,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      ],
    ),
  );
}
