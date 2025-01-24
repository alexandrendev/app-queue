import 'package:app_queue/components/my_button.dart';
import 'package:app_queue/components/my_checkBox.dart';
import 'package:app_queue/components/my_dropdown_button.dart';
import 'package:app_queue/components/my_text_input.dart';

import 'package:flutter/material.dart';

class CadastroUsuario extends StatefulWidget {
  const CadastroUsuario({super.key});

  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  bool isChecked = false; // Variável que controlará o estado do checkbox
  
  // Controladores de texto para os campos de entrada
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController dataNascimentoController = TextEditingController();
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController = TextEditingController();

  // Variáveis para o Dropdown (Menu suspenso)
  String? selectedCargo; // Cargo selecionado

  // Lista de cargos para o Dropdown
  final List<String> cargos = ['Atendente', 'Enfermeiro', 'Médico'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.74,
                child: Column(
                  children: [
                    MyTextInput(
                      hintText: 'Nome',
                      obscureText: false,
                      controller: nomeController,
                      validator: null,
                      keyboardType: TextInputType.text,
                    ),
                    MyTextInput(
                      hintText: 'Data de Nascimento:',
                      obscureText: false,
                      controller: dataNascimentoController,
                      validator: null,
                      keyboardType: TextInputType.datetime,
                    ),
                    MyTextInput(
                      hintText: 'Matricula',
                      obscureText: false,
                      controller: matriculaController,
                      validator: null,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextInput(
                      hintText: 'Criar senha',
                      obscureText: true, 
                      controller: senhaController,
                      validator: null,
                      keyboardType: TextInputType.text,
                    ),
                    MyTextInput(
                      hintText: 'Confirmar senha',
                      obscureText: true, 
                      controller: confirmarSenhaController,
                      validator: null,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children:[
                      MyDropdownButton(
                        selectedValue: selectedCargo, // Passando o valor selecionado
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCargo = newValue; // Atualiza o cargo selecionado
                          });
                        },
                        items: cargos, // Passando a lista de cargos
                    ),
                    ]
                        
                    ),

                    Row(
                      children: [
                        MyCheckbox(
                          initialValue: isChecked, // Valor inicial do checkbox
                          onChanged: (bool value) {
                            setState(() {
                              isChecked = value; // Atualiza o valor de isChecked
                            });
                          },
                        ),
                        const SizedBox(width: 8,), // Espaço entre checkbox e texto
                        const Text(
                          'Aceito os termos e condições', // Texto ao lado do checkbox
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        MyButton(
                          buttonText: 'Cancelar',
                          onTapButton: () {
                            // Limpar os campos
                            nomeController.clear();
                            dataNascimentoController.clear();
                            matriculaController.clear();
                            senhaController.clear();
                            confirmarSenhaController.clear();
                            setState(() {
                              isChecked = false; // Desmarcar o checkbox
                              selectedCargo = null; // Limpar o cargo selecionado
                            });
                          },
                          backgroundColor: Colors.red,
                          textColor: Colors.black,
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        MyButton(
                          buttonText: 'Salvar',
                          onTapButton: () {
                            // Aqui você pode adicionar a lógica de salvar os dados
                            if (senhaController.text == confirmarSenhaController.text) {
                              // Salvar os dados
                              print("Dados salvos com sucesso!");
                            } else {
                              // Exibir um erro de confirmação de senha
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('As senhas não coincidem!')),
                              );
                            }
                          },
                          backgroundColor: Colors.green,
                          textColor: Colors.black,
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.3,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
