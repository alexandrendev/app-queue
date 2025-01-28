import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  final String? selectedValue;
  final Function(String?) onChanged;
  final List<String> items;

  const MyDropdown({
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
