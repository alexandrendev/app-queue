import 'package:app_queue/components/my_botton_app_bar.dart';
import 'package:app_queue/components/my_up_app_bar.dart';
import 'package:app_queue/pages/cadastro_paciente.dart';
import 'package:app_queue/pages/home_atendente.dart';
import 'package:flutter/material.dart';

class InitalPage extends StatefulWidget {
  const InitalPage({super.key});

  @override
  State<InitalPage> createState() => _InitalPageState();
}

class _InitalPageState extends State<InitalPage> {
  int _selectedIndex = 0;

  final List _pages = [
    HomeAtendente(),
    CadastroPaciente(),
  ];

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyUpAppBar(),
      bottomNavigationBar: MyBottomBar(_selectPage, _selectedIndex),
      body: _pages[_selectedIndex],
    );
  }
}
