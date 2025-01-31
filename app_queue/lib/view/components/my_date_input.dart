import 'package:flutter/material.dart';

class MyDateInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool enabled;
  final String placeHolder;

  const MyDateInput({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
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
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          ),
          keyboardType: TextInputType.datetime,
          style: TextStyle(fontSize: 16),
          enabled: enabled,
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (selectedDate != null) {
              controller.text =
                  "${selectedDate.day.toString().padLeft(2, '0')}-"
                  "${(selectedDate.month).toString().padLeft(2, '0')}-"
                  "${selectedDate.year}";
            }
          },
        ),
      ],
    );
  }
}
