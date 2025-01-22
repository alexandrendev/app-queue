import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  void Function()? onTapButton;
  final Color? backgroundColor;
  final Color? textColor;

  MyButton({
    super.key,
    required this.buttonText,
    required this.onTapButton,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding:
            const EdgeInsets.only(bottom: 15, top: 15, left: 75, right: 75),
        child: Center(
          child: Text(
          buttonText,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            )),
        ), 
      ),
    );
  }
}