import 'package:app_queue/components/my_botton_app_bar.dart';
import 'package:app_queue/components/my_up_app_bar.dart';
import 'package:flutter/material.dart';

class HomeAtendente extends StatelessWidget {
  const HomeAtendente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyUpAppBar(),
      body: Row(),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
