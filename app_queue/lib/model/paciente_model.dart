import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class PacienteModel {
  String id;
  String nome;
  String cpf;
  String telefone;
  String endereco;

  PacienteModel({
    required this.id,
    required this.nome,
    required this.cpf,
    required this.telefone,
    required this.endereco,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': nome,
      'cpf': cpf,
      'telefone': telefone,
      'endereco': endereco,
    };
  }

  factory PacienteModel.fromMap(Map<String, dynamic> map) {
    return PacienteModel(
      id: map['id'] ?? '',
      nome: map['name'] ?? '',
      cpf: map['cpf'] ?? '',
      telefone: map['telefone'] ?? '',
      endereco: map['endereco'] ?? '',
    );
  }

  factory PacienteModel.fromParse(ParseObject parseObject) {
    return PacienteModel(
        id: parseObject.objectId ?? '',
        nome: parseObject.get<String>('name') ?? 'Desconhecido',
        cpf: parseObject.get<String>('cpf') ?? '',
        telefone: parseObject.get<String>('telefone') ?? 'Não informado',
        endereco: parseObject.get<String>('endereco') ?? 'Não Informado');
  }
}
