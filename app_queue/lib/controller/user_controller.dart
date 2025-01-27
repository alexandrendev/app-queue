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
    final String matricula = matriculaController.text.trim();
    final String senha = senhaController.text.trim();

    final ParseUser user = ParseUser(name, senha, matricula)
      ..set('birthDate', dataNascimento)
      ..set('role', cargo);

    try {
      await user.signUp();
      return true;
    } catch (e) {
      error = e.toString();
      return false;
    }
  }
}
