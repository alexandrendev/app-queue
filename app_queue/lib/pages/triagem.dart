import 'package:app_queue/components/my_button.dart';
import 'package:app_queue/components/my_checkBox.dart';
import 'package:app_queue/components/my_dropdown.dart';
import 'package:app_queue/components/my_text_input.dart';
import 'package:flutter/material.dart';

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

  // Variável para controlar o dropdown
  String selectedPriority = 'Selecione a prioridade';

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
                      'Paciente: Antonio Jose',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.amberAccent,
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
                ),
                MyTextInput(
                  hintText: 'Pressão Arterial:',
                  obscureText: false,
                  controller: TextEditingController(),
                  validator: null,
                  keyboardType: TextInputType.text,
                  prefixIcon: Icons.format_shapes,
                ),
                MyTextInput(
                  hintText: 'Temperatura:',
                  obscureText: false,
                  controller: TextEditingController(),
                  validator: null,
                  keyboardType: TextInputType.text,
                  prefixIcon: Icons.thermostat,
                ),
                MyTextInput(
                  hintText: 'Peso:',
                  obscureText: false,
                  controller: TextEditingController(),
                  validator: null,
                  keyboardType: TextInputType.text,
                  prefixIcon: Icons.line_weight,
                ),
                MyTextInput(
                  hintText: 'Altura:',
                  obscureText: false,
                  controller: TextEditingController(),
                  validator: null,
                  keyboardType: TextInputType.text,
                  prefixIcon: Icons.height,
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text('Tem histórico de doenças familiar?'),
                    SizedBox(width: 20),
                    MyCheckbox(
                      text: 'Sim',
                      initialValue: hasFamilyHistory,
                      onChanged: (value) {
                        setState(() {
                          hasFamilyHistory = value;
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
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text('Possui doenças preexistentes?'),
                    SizedBox(width: 20),
                    MyCheckbox(
                      text: 'Sim',
                      initialValue: hasPreExistingConditions,
                      onChanged: (value) {
                        setState(() {
                          hasPreExistingConditions = value;
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
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text('Faz uso de medicação contínua?'),
                    SizedBox(width: 20),
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
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text('Possui alergias?'),
                    SizedBox(width: 20),
                    MyCheckbox(
                      text: 'Sim',
                      initialValue: hasAllergies,
                      onChanged: (value) {
                        setState(() {
                          hasAllergies = value;
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
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text('Já fez alguma cirurgia?'),
                    SizedBox(width: 20),
                    MyCheckbox(
                      text: 'Sim',
                      initialValue: hasHadSurgery,
                      onChanged: (value) {
                        setState(() {
                          hasHadSurgery = value;
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
                    )
                  ],
                ),
                SizedBox(height: 15),
                Row(
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
