import 'package:app_queue/model/Prioridade.dart';
import 'package:app_queue/model/paciente_model.dart';
import 'dart:convert';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class FichaModel {
  PacienteModel paciente;
  Prioridade prioridade;
  bool medicacao_continua;
  String observacoes;

  FichaModel({
    required this.paciente,
    required this.prioridade,
    required this.medicacao_continua,
    required this.observacoes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'paciente': paciente.toMap(),
      'prioridade': prioridade.valor,
      'medicacao_continua': medicacao_continua,
      'observacoes': observacoes,
    };
  }

  String toJson() => json.encode(toMap());

  factory FichaModel.fromMap(Map<String, dynamic> map) {
    return FichaModel(
      paciente: PacienteModel.fromMap(map['paciente'] as Map<String, dynamic>),
      prioridade: Prioridade.fromValor(map['prioridade'] as int),
      medicacao_continua: map['medicacao_continua'] as bool,
      observacoes: map['observacoes'] as String,
    );
  }

  factory FichaModel.fromJson(String source) =>
      FichaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FichaModel(paciente: $paciente, prioridade: $prioridade, medicacao_continua: $medicacao_continua, observacoes: $observacoes)';
  }

  @override
  bool operator ==(covariant FichaModel other) {
    if (identical(this, other)) return true;

    return other.paciente == paciente &&
        other.prioridade == prioridade &&
        other.medicacao_continua == medicacao_continua &&
        other.observacoes == observacoes;
  }

  @override
  int get hashCode {
    return paciente.hashCode ^
        prioridade.hashCode ^
        medicacao_continua.hashCode ^
        observacoes.hashCode;
  }

  factory FichaModel.fromParseObject(ParseObject parseObject) {
    final pacienteObj = parseObject.get<ParseObject>('paciente');
    final paciente = PacienteModel(
      id: pacienteObj?.objectId ?? '',
      nome: pacienteObj?.get<String>('name') ?? 'Desconhecido',
      cpf: pacienteObj?.get<String>('cpf') ?? '',
      telefone: pacienteObj?.get<String>('phone') ?? '',
      endereco: pacienteObj?.get<String>('address') ?? '',
    );

    return FichaModel(
      paciente: paciente,
      prioridade: Prioridade.fromValor(parseObject.get<int>('prioridade') ?? 1),
      medicacao_continua: parseObject.get<bool>('medicacao_continua') ?? false,
      observacoes: parseObject.get<String>('observacoes') ?? '',
    );
  }
}
