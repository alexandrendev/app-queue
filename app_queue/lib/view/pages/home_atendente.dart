// import 'package:app_queue/components/my_button.dart';
// import 'package:app_queue/components/my_person.dart';
// import 'package:app_queue/components/my_priority.dart';
// import 'package:app_queue/controller/ficha_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

// class HomeAtendente extends StatefulWidget {
//   HomeAtendente({super.key});
//   @override
//   _HomeAtendenteState createState() => _HomeAtendenteState();
// }

// class _HomeAtendenteState extends State<HomeAtendente> {
//   // late Future<List<ParseObject>> _fichas = FichaController().getFichasDoDia();

//   @override
//   void initState() {
//     super.initState();
//     // _pacientes =
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<ParseObject>>(
//         future: _fichas,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(
//                 child: Text('Erro ao carregar as fichas: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('Nenhuma ficha encontrada para hoje.'));
//           }

//           final fichas = snapshot.data!;
//           return ListView.builder(
//             itemCount: fichas.length,
//             itemBuilder: (context, index) {
//               final ficha = fichas[index];
//               final paciente = ficha.get<String>('paciente') ?? 'Desconhecido';
//               final prioridade =
//                   ficha.get<String>('prioridade') ?? 'Sem prioridade';
//               final data = ficha.get<DateTime>('data');

//               return ListTile(
//                 title: Text(paciente),
//                 subtitle:
//                     Text('Prioridade: $prioridade\nData: ${DateTime.now()}'),
//                 onTap: () {
//                   // Ação ao clicar em uma ficha
//                   print('Ficha do paciente $paciente selecionada.');
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
