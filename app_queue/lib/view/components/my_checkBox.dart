import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final String text;

  const MyCheckbox({
    super.key,
    required this.initialValue,
    required this.onChanged,
    required this.text,
  });

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Evita que o Row ocupe todo o espaço
      children: [
        Text(widget.text),
        Checkbox(
          value: widget.initialValue,
          onChanged: (bool? value) {
            if (value != null) {
              widget.onChanged(value); // Atualiza o estado externo
            }
          },
        ),
      ],
    );
  }
}
