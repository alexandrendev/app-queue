import 'package:flutter/material.dart';

class MyTextOutput extends StatelessWidget {
  final String labelText;
  final String value;
  final IconData? prefixIcon;

  const MyTextOutput({
    super.key,
    required this.labelText,
    required this.value,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText, // Rótulo do campo
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .surfaceContainerHighest
                .withOpacity(0.2), // Fundo levemente diferente
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              if (prefixIcon != null)
                Icon(prefixIcon,
                    size: 20, color: Theme.of(context).colorScheme.onSecondary),
              if (prefixIcon != null) SizedBox(width: 10),
              Expanded(
                child: Text(
                  value.isNotEmpty
                      ? value
                      : 'N/A', // Garante que não fique vazio
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10), // Adiciona espaçamento entre os elementos
      ],
    );
  }
}
