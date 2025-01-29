import 'package:app_queue/model/ficha/Prioridade.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String text;
  final Prioridade? prioridade;

  CustomTitle({required this.prioridade, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Prioridade.getColor(prioridade!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CustomSubtitle extends StatelessWidget {
  final String text;
  const CustomSubtitle({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Widget child;
  const CustomCard({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 4,
      color: Theme.of(context).colorScheme.onPrimary,
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
