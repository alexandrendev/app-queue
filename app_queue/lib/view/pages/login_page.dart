import 'package:app_queue/controller/usuario/user_controller.dart';
import 'package:app_queue/view/components/my_button.dart';
import 'package:app_queue/view/components/my_logo.dart';
import 'package:app_queue/view/components/my_text_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = UserController();

  login(context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Atenção'),
            content: const Text('Preencha todos os campos!'),
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
    } else {
      var response =
          await controller.Login(emailController, passwordController);
      if (response == true)
        Navigator.pushNamed(context, '/initial');
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email ou senha incorretos!'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(27),
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
                  hintText: 'Email:',
                  obscureText: false,
                  controller: emailController,
                  validator: null,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_rounded,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 250,
                child: MyTextInput(
                  hintText: 'Digite sua senha:',
                  obscureText: true,
                  controller: passwordController,
                  validator: null,
                  keyboardType: TextInputType.text,
                  prefixIcon: Icons.lock,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.06,
                child: MyButton(
                  buttonText: 'Entrar',
                  onTapButton: () => {login(context)},
                  backgroundColor: Colors.green,
                  textColor: Colors.black,
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ),
              const SizedBox(height: 7),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.06,
                child: MyButton(
                  buttonText: 'Cadastrar',
                  onTapButton: () {
                    Navigator.pushNamed(context, '/cadastro');
                  },
                  backgroundColor: Colors.deepOrangeAccent,
                  textColor: Colors.black,
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
