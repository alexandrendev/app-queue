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
          validator: validator,
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
            prefixIcon: Icon(prefixIcon,
                color: Theme.of(context).colorScheme.onSecondary),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
