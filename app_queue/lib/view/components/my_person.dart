import 'package:flutter/material.dart';

class MyPerson extends StatelessWidget {
  final String name;

  const MyPerson({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name,
        style: TextStyle(
          // color: Colors.white,
          fontSize: 17,
        ),
      ),
    );
  }
}
