// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget implements PreferredSizeWidget {
  const MyBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Icon(Icons.people), Icon(Icons.list)],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(35.0);
}
