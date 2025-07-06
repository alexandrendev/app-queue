import 'package:app_queue/model/user/cargo.dart';
import 'package:app_queue/view/components/connection_status_bar.dart';
import 'package:app_queue/view/components/my_botton_app_bar.dart';
import 'package:app_queue/view/components/my_up_app_bar.dart';
import 'package:app_queue/view/pages/cadastro_paciente.dart';
import 'package:app_queue/view/pages/fichaList.dart';
import 'package:app_queue/view/pages/informacoes_paciente.dart';
import 'package:app_queue/view/pages/triagem.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class InitalPage extends StatefulWidget {
  const InitalPage({super.key});

  @override
  State<InitalPage> createState() => _InitalPageState();
}

class _InitalPageState extends State<InitalPage> {
  int _selectedIndex = 0;
  final List _pages = [];
  Cargo? role;

  Future<int?> getUserRole() async {
    final user = await ParseUser.currentUser() as ParseUser?;
    return user?.get<int>('cargo');
  }

  @override
  void initState() {
    super.initState();
    loadUserRole();
  }

  void loadUserRole() async {
    var roleNum = await getUserRole();
    if (roleNum != null) {
      setState(() {
        role = Cargo.fromValor(roleNum);
        validUserRole();
      });
    }
  }

  void validUserRole() {
    if (role == Cargo.atendente) {
      _pages.add(FichaListScreen());
      _pages.add(CadastroPaciente());
    } else if (role == Cargo.enfermeiro) {
      _pages.add(FichaListScreen());
      _pages.add(Triagem());
    } else if (role == Cargo.medico) {
      _pages.add(FichaListScreen());
      _pages.add(InformacoesPaciente());
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_pages.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: MyUpAppBar(),
      bottomNavigationBar: MyBottomBar(_selectPage, _selectedIndex),
      body: Column(
        children: [
          const ConnectionStatusBar(),
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}
