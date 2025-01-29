import 'dart:convert';
import 'package:app_queue/model/ficha/Prioridade.dart';
import 'package:app_queue/model/paciente_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class FichaModel {
  PacienteModel paciente;
  Prioridade prioridade;
  String observacoes;
  bool medicacaoContinua;
  bool historicoDoencasFamiliar;
  bool doencasPreexistentes;
  bool alergias;
  bool operado;
  String pressao;
  double temperatura;
  double peso;
  double altura;

  FichaModel({
    required this.paciente,
    required this.prioridade,
    required this.medicacaoContinua,
    required this.observacoes,
    required this.pressao,
    required this.temperatura,
    required this.peso,
    required this.altura,
    required this.historicoDoencasFamiliar,
    required this.doencasPreexistentes,
    required this.alergias,
    required this.operado,
  });

  Map<String, dynamic> toMap() {
    return {
      'paciente': paciente.toMap(),
      'prioridade': prioridade.valor,
      'medicacao_continua': medicacaoContinua,
      'observacoes': observacoes,
      'pressao': pressao,
      'temperatura': temperatura,
      'peso': peso,
      'altura': altura,
      'historico_doencas_familiar': historicoDoencasFamiliar,
      'doencas_pre_existentes': doencasPreexistentes,
      'possui_alergias': alergias,
      'operado': operado,
    };
  }

  String toJson() => json.encode(toMap());

  factory FichaModel.fromMap(Map<String, dynamic> map) {
    return FichaModel(
      paciente: PacienteModel.fromMap(map['paciente'] as Map<String, dynamic>),
      prioridade: Prioridade.fromValor(map['prioridade'] as int),
      medicacaoContinua: map['medicacao_continua'] as bool,
      observacoes: map['observacoes'] as String,
      pressao: map['pressao'] as String,
      temperatura: (map['temperatura'] as num).toDouble(),
      peso: (map['peso'] as num).toDouble(),
      altura: (map['altura'] as num).toDouble(),
      historicoDoencasFamiliar: (map['historico_doencas_familiar'] as bool),
      doencasPreexistentes: map['doencas_pre_existentes'] as bool,
      alergias: map['possui_alergias'] as bool,
      operado: map['operado'] as bool,
    );
  }

  factory FichaModel.fromJson(String source) =>
      FichaModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FichaModel(paciente: $paciente, prioridade: $prioridade, medicacao_continua: $medicacaoContinua, observacoes: $observacoes)';
  }

  @override
  bool operator ==(covariant FichaModel other) {
    if (identical(this, other)) return true;

    return other.paciente == paciente &&
        other.prioridade == prioridade &&
        other.medicacaoContinua == medicacaoContinua &&
        other.observacoes == observacoes &&
        other.pressao == pressao &&
        other.temperatura == temperatura &&
        other.peso == peso &&
        other.altura == altura;
  }

  @override
  int get hashCode {
    return paciente.hashCode ^
        prioridade.hashCode ^
        medicacaoContinua.hashCode ^
        observacoes.hashCode ^
        pressao.hashCode ^
        temperatura.hashCode ^
        peso.hashCode ^
        altura.hashCode;
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
      medicacaoContinua: parseObject.get<bool>('medicacao_continua') ?? false,
      observacoes: parseObject.get<String>('observacoes') ?? '',
      pressao: parseObject.get<String>('pressao') ?? '',
      temperatura: (parseObject.get<num>('temperatura') ?? 0.0).toDouble(),
      peso: (parseObject.get<num>('peso') ?? 0.0).toDouble(),
      altura: (parseObject.get<num>('altura') ?? 0.0).toDouble(),
      historicoDoencasFamiliar:
          parseObject.get<bool>('historico_doencas_familiar') ?? false,
      doencasPreexistentes:
          parseObject.get<bool>('doencas_pre_existentes') ?? false,
      alergias: parseObject.get<bool>('possui_alergias') ?? false,
      operado: parseObject.get<bool>('operado') ?? false,
    );
  }
}
