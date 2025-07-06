import 'package:app_queue/model/paciente_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class SearchService {
  static Future<List<PacienteModel>> searchPatients(String query) async {
    if (query.trim().isEmpty) return [];

    try {
      final queryBuilder = QueryBuilder<ParseObject>(ParseObject('paciente'));
      
      // Busca por nome ou CPF
      queryBuilder.whereContains('name', query, caseSensitive: false);
      
      final response = await queryBuilder.query();
      
      if (response.success && response.results != null) {
        return response.results!
            .map((parseObject) => PacienteModel.fromParse(parseObject))
            .toList();
      }
      
      return [];
    } catch (e) {
      print('Erro na busca: $e');
      return [];
    }
  }

  static Future<PacienteModel?> findPatientByCpf(String cpf) async {
    try {
      final queryBuilder = QueryBuilder<ParseObject>(ParseObject('paciente'))
        ..whereEqualTo('cpf', cpf.replaceAll(RegExp(r'[^0-9]'), ''));
      
      final response = await queryBuilder.query();
      
      if (response.success && response.results != null && response.results!.isNotEmpty) {
        return PacienteModel.fromParse(response.results!.first);
      }
      
      return null;
    } catch (e) {
      print('Erro ao buscar por CPF: $e');
      return null;
    }
  }
}