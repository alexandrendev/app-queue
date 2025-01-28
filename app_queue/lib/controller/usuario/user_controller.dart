import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserController {
  late String error;

  Future<bool> saveUser(
    TextEditingController nameController,
    TextEditingController dataNascimentoController,
    TextEditingController matriculaController,
    TextEditingController senhaController,
    String? cargo,
  ) async {
    final String name = nameController.text.trim();
    final String dataNascimento = dataNascimentoController.text.trim();
    final String email = matriculaController.text.trim();
    final String senha = senhaController.text.trim();

    final ParseUser user = ParseUser(name, senha, email)
      ..set('birthDate', dataNascimento)
      ..set('cargo', cargo);

    try {
      await user.signUp();
      return true;
    } catch (e) {
      error = e.toString();
      return false;
    }
  }

  Future<bool> Login(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final userData = ParseUser(email, password, null);

    var responseUser = await userData.login();
    if (responseUser.success) return true;
    return false;
  }
}
