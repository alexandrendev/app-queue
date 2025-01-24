import 'package:flutter/material.dart';

class MyDropdownButton extends StatelessWidget {
  final String? selectedValue; // O valor atualmente selecionado
  final Function(String?) onChanged; // Função que será chamada quando o valor mudar
  final List<String> items; // Lista de itens (cargos) disponíveis

  const MyDropdownButton({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      hint: const Text('Selecione o Cargo'),
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
