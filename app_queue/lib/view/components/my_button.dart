import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String buttonText;
  final void Function()? onTapButton;
  final Color? backgroundColor;
  final Color? textColor;
  final double height;
  final double width;
  final bool isLoading;

  const MyButton({
    super.key,
    required this.buttonText,
    required this.onTapButton,
    required this.backgroundColor,
    required this.textColor,
    required this.height,
    required this.width,
    this.isLoading = false,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.isLoading ? null : widget.onTapButton,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: _isPressed 
            ? widget.backgroundColor?.withOpacity(0.8) 
            : widget.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: _isPressed ? [] : [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: widget.isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    widget.textColor ?? Colors.white,
                  ),
                ),
              )
            : Text(
                widget.buttonText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.textColor,
                ),
              ),
        ),
      ),
    );
  }
}
