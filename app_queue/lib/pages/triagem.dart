import 'package:app_queue/components/my_button.dart';
import 'package:app_queue/components/my_checkBox.dart';
import 'package:app_queue/components/my_dropdown.dart';
import 'package:app_queue/components/my_text_input.dart';
import 'package:flutter/material.dart';

class Triagem extends StatelessWidget {
  const Triagem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(20),
      child: ListView(children: [
        Container(child: Column(
      children: [
        Text('Triagem'),
        Text('Paciente: Antonio Jose'),
        
        MyTextInput(hintText: 'Paciente queixa:',
        obscureText: false,
        controller: TextEditingController(),
        validator: null,
        keyboardType: TextInputType.text,
        ),
        MyTextInput(hintText: 'Pressão Arterial:',
        obscureText: false,
        controller: TextEditingController(),
        validator: null,
        keyboardType: TextInputType.text,
        ),
        MyTextInput(hintText: 'Temperatura:',
        obscureText: false,
        controller: TextEditingController(),
        validator: null,
        keyboardType: TextInputType.text,
        ),
        MyTextInput(hintText: 'Peso:',
        obscureText: false,
        controller: TextEditingController(),
        validator: null,
        keyboardType: TextInputType.text,
        ),
        MyTextInput(hintText: 'Altura:',
        obscureText: false,
        controller: TextEditingController(),
        validator: null,
        keyboardType: TextInputType.text,
        ),
        Row(children: [
          Text('Tem historico de doenças familiar?'),
          MyCheckbox(initialValue: false, onChanged: (value) => {
          value = !value
        })

        ],),
        Row(children: [
          Text('Possue doenças pre existentes?'),
          MyCheckbox(initialValue: false, onChanged: (value) => {
          value = !value
        })

        ],),
        Row(
          children: [
            Text('Faz uso de medicação contínua?'),
            MyCheckbox(
              initialValue: false, 
              onChanged: (value) => {
                value = !value
              }
        )

        ],),
        Row(children: [
          Text('Possui alergias?'),
          MyCheckbox(initialValue: false, onChanged: (value) => {
          value = !value
        })

        ],),
        Row(children: [
          Text('Já fez alguma cirurgia?'),
          MyCheckbox(initialValue: false, onChanged: (value) => {
          value = !value
        })

        ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text('Prioridade (protocolo manchester):'),
                  MyDropdown(
                    selectedValue: 'Selecione a prioridade',
                    onChanged: (String? selectedValue) => {
                      selectedValue = selectedValue!
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
            ],
          ), 
        SizedBox(height: 70,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MyButton(buttonText: 'Salvar',
              onTapButton: () {},
              backgroundColor: Colors.red,
              textColor: Colors.white,
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.25
            ),
          ],
        )

        ],
        ),
      ),
      ]),
    );
  }
}