import 'package:app_queue/model/ficha/ficha_model.dart';
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

  Future<List<ParseObject>> getFichasDoDia() async {
    try {
      DateTime now = DateTime.now();
      DateTime startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
      DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      final query = QueryBuilder<ParseObject>(ParseObject('ficha'))
        ..whereGreaterThanOrEqualsTo('createdAt', startOfDay)
        ..whereLessThanOrEqualTo('createdAt', endOfDay)
        ..orderByAscending('createdAt')
        ..orderByAscending('priority')
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

  // Future<String> getPrimeiroDaFila() async {
  //   String nome = '';
  //   try {
  //     final query = QueryBuilder<ParseObject>(ParseObject('ficha'))
  //       ..whereGreaterThanOrEqualsTo('createdAt', DateTime.now())
  //       ..orderByAscending('createdAt')
  //       ..orderByAscending('priority')
  //       ..includeObject(['paciente']);

  //     final response = await query.query();

  //     if (response.success &&
  //         response.results != null &&
  //         response.results!.isNotEmpty) {
  //       nome = response.get<ParseObject>('paciente').get<String>('nome');
  //     }
  //   } catch (e) {
  //     error = e.toString();
  //   }
  //   return nome;
  // }
}
