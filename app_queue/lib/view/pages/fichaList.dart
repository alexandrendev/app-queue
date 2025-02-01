import 'package:app_queue/model/user/cargo.dart';
import 'package:app_queue/view/components/my_card.dart';
import 'package:app_queue/controller/ficha/ficha_controller.dart';
import 'package:app_queue/model/ficha/Prioridade.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class FichaListScreen extends StatefulWidget {
  @override
  _FichaListScreenState createState() => _FichaListScreenState();
}

class _FichaListScreenState extends State<FichaListScreen> {
  final FichaController _fichaController = FichaController();
  late Future<List<ParseObject>> _fichas;
  Color? color;
  Prioridade? prioridade;

  @override
  void initState() {
    super.initState();
    _fichas = init();
  }

  Future<List<ParseObject>> init() async {
    final user = await ParseUser.currentUser() as ParseUser?;
    if (user != null) {
      final cargo = user.get<int>('cargo');
      if (cargo == Cargo.medico.valor) {
        return _fichaController.getFichasDoDia();
      } else {
        return _fichaController.getFichasDoDiaEnfermeiro();
      }
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fichas de Hoje'),
      ),
      body: FutureBuilder<List<ParseObject>>(
        future: _fichas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('Nenhuma ficha encontrada para hoje.'));
          }

          final fichas = snapshot.data!;
          return ListView.builder(
            itemCount: fichas.length,
            itemBuilder: (context, index) {
              final ficha = fichas[index];

              final pacienteObj = ficha.get<ParseObject>('paciente');
              final paciente = pacienteObj != null
                  ? pacienteObj.get<String>('name') ?? 'Desconhecido'
                  : 'Desconhecido';

              final observations =
                  ficha.get<String>('observations') ?? 'Sem observações';
              final priority = ficha.get<int>('prioridade') ?? 0;
              final createdAt =
                  ficha.get<DateTime>('createdAt') ?? DateTime.now();

              prioridade = Prioridade.fromValor(priority);
              color = Prioridade.getColor(prioridade!);

              return CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CustomTitle(
                        text: 'Paciente: $paciente',
                        prioridade: prioridade,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomSubtitle(text: 'Prioridade: ${prioridade!.nome}'),
                    const SizedBox(height: 4),
                    CustomSubtitle(text: 'Observações: $observations'),
                    const SizedBox(height: 4),
                    CustomSubtitle(text: 'Data: ${createdAt.toLocal()}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
