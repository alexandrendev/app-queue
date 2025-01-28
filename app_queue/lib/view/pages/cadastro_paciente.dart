import 'package:app_queue/view/components/my_button.dart';
import 'package:app_queue/view/components/my_text_input.dart';
import 'package:app_queue/controller/paciente/paciente_controller.dart';
import 'package:flutter/material.dart';

class CadastroPaciente extends StatelessWidget {
  final PacienteController controller = PacienteController();

  CadastroPaciente({super.key});
  final TextEditingController nomePacienteController = TextEditingController();
  final TextEditingController dataPacienteController = TextEditingController();
  final TextEditingController cpfPacienteController = TextEditingController();
  final TextEditingController telefonePacienteController =
      TextEditingController();
  final TextEditingController nomeMaePacienteController =
      TextEditingController();
  final TextEditingController enderecoPacienteController =
      TextEditingController();

  _savePaciente() {
    controller.savePaciente(
      nomePacienteController,
      cpfPacienteController,
      telefonePacienteController,
      nomeMaePacienteController,
      enderecoPacienteController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cadastro de Paciente',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Column(
                    children: [
                      TextField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          hintText: 'CPF',
                          prefixIcon: Icon(Icons.search), // Ícone de pesquisa
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyButton(
                        buttonText: 'Pesquisar',
                        onTapButton: () {},
                        backgroundColor: Colors.blue,
                        textColor: Colors.black,
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.74,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextInput(
                      hintText: 'Nome',
                      obscureText: false,
                      controller: nomePacienteController,
                      validator: null,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.perm_identity,
                    ),
                    MyTextInput(
                      hintText: 'Data de Nascimento:',
                      obscureText: false,
                      controller: dataPacienteController,
                      validator: null,
                      keyboardType: TextInputType.datetime,
                      prefixIcon: Icons.calendar_today,
                    ),
                    MyTextInput(
                      hintText: 'CPF',
                      obscureText: false,
                      controller: cpfPacienteController,
                      validator: null,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.credit_card,
                    ),
                    MyTextInput(
                      hintText: 'Telefone',
                      obscureText: false,
                      controller: telefonePacienteController,
                      validator: null,
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.phone,
                    ),
                    MyTextInput(
                      hintText: 'Nome da mãe',
                      obscureText: false,
                      controller: nomeMaePacienteController,
                      validator: null,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.perm_identity,
                    ),
                    MyTextInput(
                      hintText: 'Endereço',
                      obscureText: false,
                      controller: enderecoPacienteController,
                      validator: null,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.location_on,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        MyButton(
                          buttonText: 'Cancelar',
                          onTapButton: () {},
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
                          onTapButton: _savePaciente,
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
