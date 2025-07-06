import 'package:app_queue/validator/validators.dart';
import 'package:app_queue/view/components/my_date_input.dart';
import 'package:app_queue/view/helpers/interface_helpers.dart';
import 'package:app_queue/view/components/my_button.dart';
import 'package:app_queue/view/components/my_text_input.dart';
import 'package:app_queue/controller/paciente/paciente_controller.dart';
import 'package:app_queue/view/helpers/route_helpers.dart';
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

  final _formKey = GlobalKey<FormState>();

  _savePaciente(context) async {
    var response = await controller.savePaciente(
      nomePacienteController,
      cpfPacienteController,
      telefonePacienteController,
      nomeMaePacienteController,
      enderecoPacienteController,
    );

    if (response == true) {
      displayDialog(context, 'Paciente Cadastrado com Sucesso!', 'Mensagem',
          goToHome(context));
      goToHome(context);
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Mensagem'),
            content:
                const Text('Erro ao cadastrar Paciente! \n Tente novamente!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Container(
              //       width: MediaQuery.of(context).size.width * 0.25,
              //       child: Column(
              //         children: [
              //           TextField(
              //             controller: TextEditingController(),
              //             decoration: InputDecoration(
              //               hintText: 'CPF',
              //               prefixIcon: Icon(Icons.search), // Ícone de pesquisa
              //               border: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(8),
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           MyButton(
              //             buttonText: 'Pesquisar',
              //             onTapButton: () {},
              //             backgroundColor: Colors.blue,
              //             textColor: Colors.black,
              //             height: MediaQuery.of(context).size.height * 0.05,
              //             width: MediaQuery.of(context).size.width * 0.25,
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.74,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyTextInput(
                          hintText: 'Nome:',
                          obscureText: false,
                          controller: nomePacienteController,
                          validator: Validators.validarNome,
                          keyboardType: TextInputType.text,
                          prefixIcon: Icons.perm_identity,
                          enabled: true,
                          placeHolder: '',
                        ),
                        MyDateInput(
                            hintText: 'Data de Nascimento:',
                            controller: dataPacienteController,
                            validator: null,
                            enabled: true,
                            placeHolder: ''),
                        MyTextInput(
                            hintText: 'CPF:',
                            obscureText: false,
                            controller: cpfPacienteController,
                            validator: Validators.validarCpf,
                            keyboardType: TextInputType.number,
                            prefixIcon: Icons.credit_card,
                            enabled: true,
                            placeHolder: ''),
                        MyTextInput(
                            hintText: 'Telefone:',
                            obscureText: false,
                            controller: telefonePacienteController,
                            validator: Validators.validarTelefone,
                            keyboardType: TextInputType.number,
                            prefixIcon: Icons.phone,
                            enabled: true,
                            placeHolder: ''),
                        MyTextInput(
                            hintText: 'Nome da mãe:',
                            obscureText: false,
                            controller: nomeMaePacienteController,
                            validator: null,
                            keyboardType: TextInputType.text,
                            prefixIcon: Icons.perm_identity,
                            enabled: true,
                            placeHolder: ''),
                        MyTextInput(
                            hintText: 'Endereço:',
                            obscureText: false,
                            controller: enderecoPacienteController,
                            validator: null,
                            keyboardType: TextInputType.text,
                            prefixIcon: Icons.location_on,
                            enabled: true,
                            placeHolder: ''),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            MyButton(
                              buttonText: 'Cancelar',
                              onTapButton: () => goToHome(context),
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
                              onTapButton: () => {
                                if (_formKey.currentState?.validate() ?? false)
                                  {
                                    _savePaciente(context),
                                  },
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
