import 'package:flutter/material.dart';

// Título estilizado
class CustomTitle extends StatelessWidget {
  final String text;
  Color? color;
  CustomTitle({required this.color, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: this.color),
    );
  }
}

// Subtítulo estilizado
class CustomSubtitle extends StatelessWidget {
  final String text;
  const CustomSubtitle({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black54,
      ),
    );
  }
}

// Card estilizado
class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
