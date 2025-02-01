import 'package:app_queue/model/ficha/ficha_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class FichaController {
  late String error;

  Future<bool> saveFicha(
    FichaModel fichaModel,
  ) async {
    final ParseObject ficha = ParseObject('ficha')
      ..set('paciente',
          ParseObject('paciente')..objectId = fichaModel.paciente.id)
      ..set('observacoes', fichaModel.observacoes)
      ..set('medicacao_continua', fichaModel.medicacaoContinua)
      ..set('prioridade', fichaModel.prioridade.valor)
      ..set('temperatura', fichaModel.temperatura)
      ..set('peso', fichaModel.peso)
      ..set('pressao', fichaModel.pressao)
      ..set('historico_doencas_familiar', fichaModel.historicoDoencasFamiliar)
      ..set('possui_alergias', fichaModel.alergias)
      ..set('altura', fichaModel.altura)
      ..set('doencas_pre_existentes', fichaModel.doencasPreexistentes);
    try {
      await ficha.save();
      return true;
    } catch (e) {
      error = e.toString();
      return false;
    }
  }

  Future<bool> editFicha(FichaModel fichaModel) async {
    if (fichaModel.id == null || fichaModel.id!.isEmpty) {
      error = "ID da ficha é obrigatório para edição.";
      return false;
    }

    final ParseObject ficha = ParseObject('ficha')
      ..objectId =
          fichaModel.id // Adiciona o objectId para editar a ficha existente
      ..set('paciente',
          ParseObject('paciente')..objectId = fichaModel.paciente.id)
      ..set('observacoes', fichaModel.observacoes)
      ..set('medicacao_continua', fichaModel.medicacaoContinua)
      ..set('prioridade', fichaModel.prioridade.valor)
      ..set('temperatura', fichaModel.temperatura)
      ..set('peso', fichaModel.peso)
      ..set('pressao', fichaModel.pressao)
      ..set('historico_doencas_familiar', fichaModel.historicoDoencasFamiliar)
      ..set('possui_alergias', fichaModel.alergias)
      ..set('altura', fichaModel.altura)
      ..set('doencas_pre_existentes', fichaModel.doencasPreexistentes);

    try {
      final response = await ficha.save();
      if (response.success) {
        return true;
      } else {
        error = "Falha ao editar ficha.";
        return false;
      }
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
        ..whereGreaterThan('prioridade', 0)
        ..whereLessThan('prioridade', 6)
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

  Future<List<ParseObject>> getFichasDoDiaEnfermeiro() async {
    try {
      DateTime now = DateTime.now();
      DateTime startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
      DateTime endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      final query = QueryBuilder<ParseObject>(ParseObject('ficha'))
        ..whereGreaterThanOrEqualsTo('createdAt', startOfDay)
        ..whereLessThanOrEqualTo('createdAt', endOfDay)
        ..whereEqualTo('prioridade', 0)
        ..orderByAscending('createdAt')
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
