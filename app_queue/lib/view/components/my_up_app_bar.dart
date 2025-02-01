import 'package:app_queue/view/components/my_logo.dart';
import 'package:app_queue/view/helpers/route_helpers.dart';
import 'package:flutter/material.dart';

class MyUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyLogo(heigth: 25),
          const SizedBox(width: 15),
          const Text(
            'PA - Pronto Atendimento',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
