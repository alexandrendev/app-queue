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
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget
            .text), // Corrigido: agora exibe o texto passado via parâmetro
        Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
            widget.onChanged(isChecked); // Notificar o valor atualizado
          },
        ),
      ],
    );
  }
}
