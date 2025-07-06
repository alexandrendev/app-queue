import 'package:app_queue/model/user/cargo.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserController {
  String _error = '';
  String get error => _error;

  Future<bool> saveUser(
    TextEditingController nameController,
    TextEditingController dataNascimentoController,
    TextEditingController matriculaController,
    TextEditingController senhaController,
    String? cargo,
  ) async {
    try {
      final String name = nameController.text.trim();
      final String dataNascimento = dataNascimentoController.text.trim();
      final String email = matriculaController.text.trim();
      final String senha = senhaController.text.trim();

      if (cargo == null) {
        _error = 'Cargo não pode ser nulo';
        return false;
      }

      final ParseUser user = ParseUser(name, senha, email)
        ..set('birthDate', dataNascimento)
        ..set('cargo', Cargo.fromNome(cargo).valor);

      final response = await user.signUp();
      if (response.success) {
        return true;
      } else {
        _error = response.error?.message ?? 'Erro desconhecido ao cadastrar';
        return false;
      }
    } catch (e) {
      _error = 'Erro ao cadastrar usuário: $e';
      return false;
    }
  }

  Future<bool> login(
    TextEditingController emailController,
    TextEditingController passwordController,
  ) async {
    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final userData = ParseUser(email, password, null);
      final responseUser = await userData.login();
      
      if (responseUser.success) {
        return true;
      } else {
        _error = responseUser.error?.message ?? 'Email ou senha incorretos';
        return false;
      }
    } catch (e) {
      _error = 'Erro na conexão: $e';
      return false;
    }
  }
}
