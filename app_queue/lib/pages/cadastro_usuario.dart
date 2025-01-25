import 'package:app_queue/components/my_button.dart';
import 'package:app_queue/components/my_checkBox.dart';
import 'package:app_queue/components/my_dropdown.dart';
import 'package:app_queue/components/my_text_input.dart';
import 'package:flutter/material.dart';

class CadastroUsuario extends StatefulWidget {
  


  CadastroUsuario({super.key});

  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  bool isChecked = false;
  String? selectedCargo = 'Selecionar cargo';
  
  // Controladores de texto para os campos de entrada
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController dataNascimentoController = TextEditingController();
  final TextEditingController matriculaController = TextEditingController();
  final TextEditingController cargoController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController = TextEditingController();

  

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
                    MyDropdown(selectedValue: 'Cargo 1',
                    items: ['Cargo 1', 'Cargo 2', 'Cargo 3'],
                    onChanged: (String? newValue){
                      setState(() {
                        selectedCargo = newValue!;
                      });
                    }
                    ),
                    MyTextInput(
                      hintText: 'Criar senha',
                      obscureText: true, // Senha deve ser oculta
                      controller: senhaController,
                      validator: null,
                      keyboardType: TextInputType.text,
                    ),
                    MyTextInput(
                      hintText: 'Confirmar senha',
                      obscureText: true, // Senha deve ser oculta
                      controller: confirmarSenhaController,
                      validator: null,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        MyCheckbox(
                          initialValue: isChecked, 
                          onChanged: (bool value) {
                            setState(() {
                              isChecked = value;
                            });
                          },
                        ),
                        const SizedBox(width: 8), 
                        const Text(
                          'Aceito os termos e condições',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        
                      ],
                      
                    ),const SizedBox(
                        height: 15,
                    ),
                    Row(
                      children: [
                        MyButton(
                          buttonText: 'Cancelar',
                          onTapButton: () {
                            // Limpar os campos
                            nomeController.clear();
                            dataNascimentoController.clear();
                            matriculaController.clear();
                            cargoController.clear();
                            senhaController.clear();
                            confirmarSenhaController.clear();
                            setState(() {
                              isChecked = false; // Desmarcar o checkbox
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
