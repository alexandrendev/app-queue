// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final IconData prefixIcon;
  final bool enabled;
  final String placeHolder;

  const MyTextInput({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.prefixIcon,
    required this.enabled,
    required this.placeHolder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 16,
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator, // O validator já está correto
          decoration: InputDecoration(
            fillColor: Theme.of(context).colorScheme.onPrimary,
            hintText: placeHolder,
            hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSecondary, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSecondary, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.redAccent, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              // Adicionando borda para o erro
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              // Quando focado no erro
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.redAccent, width: 2),
            ),
            prefixIcon: Icon(prefixIcon,
                color: Theme.of(context).colorScheme.onSecondary),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            errorStyle: TextStyle(
              // Ajustando a exibição da mensagem de erro
              fontSize: 12, // Reduzindo o tamanho para caber melhor
              height: 1.2, // Controlando altura da linha para evitar corte
            ),
          ),
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: TextStyle(fontSize: 16),
          enabled: enabled,
        )
      ],
    );
  }
}
