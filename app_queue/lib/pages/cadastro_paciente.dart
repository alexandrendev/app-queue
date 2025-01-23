import 'package:app_queue/components/my_button.dart';
import 'package:app_queue/components/my_text_input.dart';
import 'package:flutter/material.dart';

class CadastroPaciente extends StatelessWidget {
  const CadastroPaciente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                      controller: TextEditingController(),
                      validator: null,
                      keyboardType: TextInputType.text,
                    ),
                    MyTextInput(
                      hintText: 'Data de Nascimento:',
                      obscureText: false,
                      controller: TextEditingController(),
                      validator: null,
                      keyboardType: TextInputType.datetime,
                    ),
                    MyTextInput(
                      hintText: 'CPF',
                      obscureText: false,
                      controller: TextEditingController(),
                      validator: null,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextInput(
                      hintText: 'Telefone',
                      obscureText: false,
                      controller: TextEditingController(),
                      validator: null,
                      keyboardType: TextInputType.number,
                    ),
                    MyTextInput(
                      hintText: 'Nome da mãe',
                      obscureText: false,
                      controller: TextEditingController(),
                      validator: null,
                      keyboardType: TextInputType.text,
                    ),
                    MyTextInput(
                      hintText: 'Endereço',
                      obscureText: false,
                      controller: TextEditingController(),
                      validator: null,
                      keyboardType: TextInputType.text,
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
                          onTapButton: () {},
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
