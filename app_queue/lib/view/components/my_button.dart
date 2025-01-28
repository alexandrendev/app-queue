import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  void Function()? onTapButton;
  final Color? backgroundColor;
  final Color? textColor;
  double height;
  double width;

  MyButton({
    super.key,
    required this.buttonText,
    required this.onTapButton,
    required this.backgroundColor,
    required this.textColor,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(buttonText,
              style: TextStyle(
                // fontSize: 8,
                fontWeight: FontWeight.bold,
                color: textColor,
              )),
        ),
      ),
    );
  }
}
