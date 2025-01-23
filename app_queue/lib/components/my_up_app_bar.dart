import 'package:app_queue/components/my_logo.dart';
import 'package:flutter/material.dart';

class MyUpAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyUpAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back),
            SizedBox(
              width: 66,
            ),
            MyLogo(heigth: 25),
            const SizedBox(
              width: 15,
            ),
            Text(
              'PA - Pronto Atendimento',
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      // centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
