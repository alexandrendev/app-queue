import 'package:app_queue/view/components/my_botton_app_bar.dart';
import 'package:app_queue/view/components/my_up_app_bar.dart';
import 'package:app_queue/view/pages/cadastro_paciente.dart';
import 'package:app_queue/view/pages/cadastro_usuario.dart';
import 'package:app_queue/view/pages/fichaList.dart';
import 'package:app_queue/view/pages/home_atendente.dart';
import 'package:app_queue/view/pages/home_consultorio.dart';
import 'package:app_queue/view/pages/triagem.dart';
import 'package:flutter/material.dart';

class InitalPage extends StatefulWidget {
  const InitalPage({super.key});

  @override
  State<InitalPage> createState() => _InitalPageState();
}

class _InitalPageState extends State<InitalPage> {
  int _selectedIndex = 0;
  final List _pages = [];
  String role = 'enfermeiro';

  @override
  void initState() {
    super.initState();
    validUserRole();
  }

  void validUserRole() {
    if (role == 'atendente') {
      _pages.add(FichaListScreen());
      // _pages.add(HomeAtendente());
      _pages.add(CadastroPaciente());
    } else if (role == 'enfermeiro') {
      // _pages.add(HomeConsultorio());
      _pages.add(CadastroUsuario());
      _pages.add(Triagem());
    } else if (role == 'medico') {
      _pages.add(HomeConsultorio());
      _pages.add(CadastroPaciente());
    }
  }

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
