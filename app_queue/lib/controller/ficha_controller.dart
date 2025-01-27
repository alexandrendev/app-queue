import 'package:app_queue/model/ficha_model.dart';
import 'package:app_queue/model/paciente_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class FichaController {
  late String error;

  Future<bool> saveFicha(
    ParseObject paciente,
    String observations,
    String priority,
  ) async {
    final ParseObject ficha = ParseObject('ficha')
      ..set('paciente', paciente)
      ..set('observations', observations)
      ..set('priority', priority);

    try {
      await ficha.save();
      return true;
    } catch (e) {
      error = e.toString();
      return false;
    }
  }

  // Future<List<ParseObject>> getFichasDoDia() async {
  //   try {
  //     DateTime now = DateTime.now();
  //     DateTime startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
  //     DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

  //     final query = QueryBuilder<ParseObject>(ParseObject('ficha'))
  //       ..whereGreaterThanOrEqualsTo('createdAt', startOfDay)
  //       ..whereLessThanOrEqualTo('createdAt', endOfDay)
  //       ..includeObject(['paciente']);

  //     final response = await query.query();

  //     if (response.success && response.results != null) {
  //       return response.results!.map((parseObject) {
  //         final pacienteObj = parseObject.get<ParseObject>('paciente');
  //         final paciente = PacienteModel(
  //           id: pacienteObj?.objectId ?? '',
  //           nome: pacienteObj?.get<String>('name') ?? 'Desconhecido',
  //           cpf: pacienteObj?.get<String>('cpf') ?? '',
  //           telefone: pacienteObj?.get<String>('phone') ?? '',
  //           endereco: pacienteObj?.get<String>('address') ?? '',
  //         );

  //         return FichaModel(
  //           paciente: paciente,
  //           prioridade:
  //               Prioridade.fromValor(parseObject.get<int>('prioridade') ?? 1),
  //           medicacao_continua:
  //               parseObject.get<bool>('medicacao_continua') ?? false,
  //           observacoes: parseObject.get<String>('observacoes') ?? '',
  //         );
  //       }).toList();
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     error = e.toString();
  //     return [];
  //   }
  // }

  Future<List<ParseObject>> getFichasDoDia() async {
    try {
      DateTime now = DateTime.now();
      DateTime startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
      DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      final query = QueryBuilder<ParseObject>(ParseObject('ficha'))
        ..whereGreaterThanOrEqualsTo('createdAt', startOfDay)
        ..whereLessThanOrEqualTo('createdAt', endOfDay)
        ..includeObject(['paciente']);

      final response = await query.query();

      if (response.success && response.results != null) {
        return response.results as List<ParseObject>;
      } else {
        return [];
      }
    } catch (e) {
      error = e.toString();
      return [];
    }
  }
}
