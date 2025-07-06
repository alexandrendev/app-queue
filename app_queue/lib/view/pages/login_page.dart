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

  Future<void> login(BuildContext context) async {
    if (emailController.text.trim().isEmpty || passwordController.text.trim().isEmpty) {
      _showErrorDialog(context, 'Atenção', 'Preencha todos os campos!');
      return;
    }

    try {
      final response = await controller.login(emailController, passwordController);
      if (response && context.mounted) {
        Navigator.pushReplacementNamed(context, '/initial');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro no login: ${controller.error}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
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
                    enabled: true,
                    placeHolder: ''),
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
                    enabled: true,
                    placeHolder: ''),
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
