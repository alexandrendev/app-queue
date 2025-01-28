import 'package:flutter/material.dart';

class Priority extends StatelessWidget {
  final Color color;
  final int position;

  const Priority({
    super.key,
    required this.color,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Center(
            child: Text(position.toString()),
          ),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8)),
        ),
      ],
    );
  }
}
