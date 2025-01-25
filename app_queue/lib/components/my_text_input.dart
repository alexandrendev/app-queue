// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final IconData prefixIcon;

  const MyTextInput({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.validator,
    required this.keyboardType,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintText: '', // Texto placeholder
            hintStyle:
                TextStyle(color: Colors.grey), // Cor do texto do placeholder
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // Bordas arredondadas
              borderSide: BorderSide(color: Colors.red), // Cor da borda
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: Colors.white), // Cor da borda ao habilitar
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.redAccent,
                  width: 2), // Cor e largura da borda ao focar
            ),
            prefixIcon:
                Icon(prefixIcon, color: Colors.white), // Ícone de prefixo
            contentPadding: EdgeInsets.symmetric(
                vertical: 10, horizontal: 15), // Espaçamento interno
          ),
          obscureText: obscureText, // Define se o texto é oculto
          keyboardType: keyboardType, // Tipo de teclado
          style: TextStyle(fontSize: 16), // Estilo do texto digitado
        )
      ],
    );
  }
}
