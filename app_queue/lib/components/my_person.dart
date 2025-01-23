import 'package:flutter/material.dart';

class MyPerson extends StatelessWidget {
  final String name;

  const MyPerson({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 20,
        ),
        Text(name),
      ],
    );
  }
}
