import 'package:app_queue/controller/ficha/ficha_controller.dart';
import 'package:app_queue/view/components/my_button.dart';
import 'package:app_queue/view/components/my_checkBox.dart';
import 'package:app_queue/view/components/my_dropdown.dart';
import 'package:app_queue/view/components/my_text_input.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Triagem extends StatefulWidget {
  const Triagem({super.key});

  @override
  _TriagemState createState() => _TriagemState();
}

class _TriagemState extends State<Triagem> {
  // Variáveis para controlar os estados das checkboxes
  bool hasFamilyHistory = false;
  bool hasPreExistingConditions = false;
  bool usesContinuousMedication = false;
  bool hasAllergies = false;
  bool hasHadSurgery = false;
  late Future<List<ParseObject>> _fichas;
  String? nomePaciente;

  final FichaController _fichaController = FichaController();

  String selectedPriority = 'Selecione a prioridade';

  @override
  void initState() {
    super.initState();
    setNomePaciente();
  }

  void setNomePaciente() async {
    List<ParseObject> fichas = await _fichaController.getFichasDoDia();
    if (fichas.isNotEmpty) {
      ParseObject ficha = fichas.first;
      ParseObject? paciente = ficha.get<ParseObject>('paciente');

      if (paciente != null) {
        nomePaciente = paciente.get<String>('name') ?? 'Paciente Desconhecido';
      } else {
        nomePaciente = '--';
      }
    } else {
      nomePaciente = 'Nenhum paciente na fila';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Triagem',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Paciente: $nomePaciente',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 40),
                MyTextInput(
                    hintText: 'Paciente queixa:',
                    obscureText: false,
                    controller: TextEditingController(),
                    validator: null,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.speaker_notes,
                    enabled: true,
                    placeHolder: ''),
                MyTextInput(
                    hintText: 'Pressão Arterial:',
                    obscureText: false,
                    controller: TextEditingController(),
                    validator: null,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.format_shapes,
                    enabled: true,
                    placeHolder: ''),
                MyTextInput(
                    hintText: 'Temperatura:',
                    obscureText: false,
                    controller: TextEditingController(),
                    validator: null,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.thermostat,
                    enabled: true,
                    placeHolder: ''),
                MyTextInput(
                    hintText: 'Peso:',
                    obscureText: false,
                    controller: TextEditingController(),
                    validator: null,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.line_weight,
                    enabled: true,
                    placeHolder: ''),
                MyTextInput(
                    hintText: 'Altura:',
                    obscureText: false,
                    controller: TextEditingController(),
                    validator: null,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.height,
                    enabled: true,
                    placeHolder: ''),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tem histórico de doenças familiar?'),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        MyCheckbox(
                          text: 'Sim',
                          initialValue: usesContinuousMedication,
                          onChanged: (value) {
                            setState(() {
                              usesContinuousMedication = value;
                            });
                          },
                        ),
                        MyCheckbox(
                          text: 'Não',
                          initialValue: hasAllergies,
                          onChanged: (value) {
                            setState(() {
                              hasAllergies = value;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Possui doenças preexistentes?'),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        MyCheckbox(
                          text: 'Sim',
                          initialValue: usesContinuousMedication,
                          onChanged: (value) {
                            setState(() {
                              usesContinuousMedication = value;
                            });
                          },
                        ),
                        MyCheckbox(
                          text: 'Não',
                          initialValue: hasAllergies,
                          onChanged: (value) {
                            setState(() {
                              hasAllergies = value;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Faz uso de medicação contínua?'),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        MyCheckbox(
                          text: 'Sim',
                          initialValue: usesContinuousMedication,
                          onChanged: (value) {
                            setState(() {
                              usesContinuousMedication = value;
                            });
                          },
                        ),
                        MyCheckbox(
                          text: 'Não',
                          initialValue: hasAllergies,
                          onChanged: (value) {
                            setState(() {
                              hasAllergies = value;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Possui alergias?'),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        MyCheckbox(
                          text: 'Sim',
                          initialValue: usesContinuousMedication,
                          onChanged: (value) {
                            setState(() {
                              usesContinuousMedication = value;
                            });
                          },
                        ),
                        MyCheckbox(
                          text: 'Não',
                          initialValue: hasAllergies,
                          onChanged: (value) {
                            setState(() {
                              hasAllergies = value;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Já fez alguma cirurgia?'),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        MyCheckbox(
                          text: 'Sim',
                          initialValue: usesContinuousMedication,
                          onChanged: (value) {
                            setState(() {
                              usesContinuousMedication = value;
                            });
                          },
                        ),
                        MyCheckbox(
                          text: 'Não',
                          initialValue: hasAllergies,
                          onChanged: (value) {
                            setState(() {
                              hasAllergies = value;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Prioridade (protocolo Manchester):'),
                    SizedBox(
                      width: 20,
                    ),
                    MyDropdown(
                      selectedValue: selectedPriority,
                      onChanged: (String? value) {
                        setState(() {
                          selectedPriority = value!;
                        });
                      },
                      items: [
                        'Selecione a prioridade',
                        'Não urgente',
                        'Pouco urgente',
                        'Urgente',
                        'Muito urgente',
                        'Emergência',
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton(
                      buttonText: 'Salvar',
                      onTapButton: () {
                        // Implementar a lógica para salvar os dados
                        print('Salvar informações da triagem');
                      },
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.25,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
