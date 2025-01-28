import 'package:app_queue/model/user/cargo.dart';

import 'dart:convert';

class UsuarioModel {
  final String email;
  final String password;
  final Cargo cargo;

  UsuarioModel({
    required this.email,
    required this.password,
    required this.cargo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
      'cargo': cargo.valor,
    };
  }

  String toJson() => json.encode(toMap());

  factory UsuarioModel.fromMap(Map<String, dynamic> map) {
    return UsuarioModel(
      email: map['email'] as String,
      password: map['password'] as String,
      cargo: Cargo.fromValor(map['cargo'] as int),
    );
  }

  factory UsuarioModel.fromJson(String source) =>
      UsuarioModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UsuarioModel(email: $email, password: $password, cargo: $cargo)';
  }

  @override
  bool operator ==(covariant UsuarioModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.password == password &&
        other.cargo == cargo;
  }

  @override
  int get hashCode {
    return email.hashCode ^ password.hashCode ^ cargo.hashCode;
  }
}
