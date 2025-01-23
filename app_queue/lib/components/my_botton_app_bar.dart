// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget implements PreferredSizeWidget {
  int _selectedIndex = 0;

  ValueChanged<int> _selectPage;

  MyBottomBar(this._selectPage, this._selectedIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _selectPage,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.people,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.update),
          label: '',
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(35.0);
}
