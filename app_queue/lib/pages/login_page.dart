import 'package:app_queue/components/my_button.dart';
import 'package:app_queue/components/my_logo.dart';
import 'package:app_queue/components/my_text_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(27),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyLogo(
              heigth: 80,
            ),
            Text(
              'PS - Queue',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),
            const SizedBox(height: 30),
            SizedBox(
              width: 250,
              child: MyTextInput(
                hintText: 'Matrícula',
                obscureText: false,
                controller: TextEditingController(),
                validator: null,
                keyboardType: TextInputType.number,
                prefixIcon: Icons.format_list_numbered,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 250,
              child: MyTextInput(
                hintText: 'Digite sua senha',
                obscureText: true,
                controller: TextEditingController(),
                validator: null,
                keyboardType: TextInputType.number,
                prefixIcon: Icons.lock,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              child: MyButton(
                buttonText: 'Entrar',
                onTapButton: () {},
                backgroundColor: Colors.green,
                textColor: Colors.black,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
            ),
            const SizedBox(height: 7),
            SizedBox(
              width: 250,
              child: MyButton(
                buttonText: 'Cadastrar',
                onTapButton: () {},
                backgroundColor: Colors.deepOrangeAccent,
                textColor: Colors.black,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
