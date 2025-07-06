import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class StatisticsService {
  static Future<Map<String, dynamic>> getDailyStatistics() async {
    try {
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day, 0, 0, 0);
      final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59);

      // Total de fichas do dia
      final totalQuery = QueryBuilder<ParseObject>(ParseObject('ficha'))
        ..whereGreaterThanOrEqualsTo('createdAt', startOfDay)
        ..whereLessThanOrEqualTo('createdAt', endOfDay);
      
      final totalResponse = await totalQuery.query();
      final totalFichas = totalResponse.results?.length ?? 0;

      // Fichas por prioridade
      final priorities = <String, int>{};
      for (int i = 1; i <= 5; i++) {
        final priorityQuery = QueryBuilder<ParseObject>(ParseObject('ficha'))
          ..whereGreaterThanOrEqualsTo('createdAt', startOfDay)
          ..whereLessThanOrEqualTo('createdAt', endOfDay)
          ..whereEqualTo('prioridade', i);
        
        final priorityResponse = await priorityQuery.query();
        final priorityName = _getPriorityName(i);
        priorities[priorityName] = priorityResponse.results?.length ?? 0;
      }

      // Fichas aguardando triagem
      final waitingQuery = QueryBuilder<ParseObject>(ParseObject('ficha'))
        ..whereGreaterThanOrEqualsTo('createdAt', startOfDay)
        ..whereLessThanOrEqualTo('createdAt', endOfDay)
        ..whereEqualTo('prioridade', 0);
      
      final waitingResponse = await waitingQuery.query();
      final waitingTriagem = waitingResponse.results?.length ?? 0;

      return {
        'totalFichas': totalFichas,
        'waitingTriagem': waitingTriagem,
        'priorities': priorities,
        'date': now,
      };
    } catch (e) {
      print('Erro ao obter estatísticas: $e');
      return {
        'totalFichas': 0,
        'waitingTriagem': 0,
        'priorities': <String, int>{},
        'date': DateTime.now(),
      };
    }
  }

  static Future<Map<String, dynamic>> getWeeklyStatistics() async {
    try {
      final now = DateTime.now();
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      final startDate = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day, 0, 0, 0);
      final endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);

      final query = QueryBuilder<ParseObject>(ParseObject('ficha'))
        ..whereGreaterThanOrEqualsTo('createdAt', startDate)
        ..whereLessThanOrEqualTo('createdAt', endDate);
      
      final response = await query.query();
      final fichas = response.results ?? [];

      final dailyCount = <String, int>{};
      for (int i = 0; i < 7; i++) {
        final date = startDate.add(Duration(days: i));
        final dayName = _getDayName(date.weekday);
        dailyCount[dayName] = 0;
      }

      for (final ficha in fichas) {
        final createdAt = ficha.get<DateTime>('createdAt');
        if (createdAt != null) {
          final dayName = _getDayName(createdAt.weekday);
          dailyCount[dayName] = (dailyCount[dayName] ?? 0) + 1;
        }
      }

      return {
        'dailyCount': dailyCount,
        'totalWeek': fichas.length,
        'startDate': startDate,
        'endDate': endDate,
      };
    } catch (e) {
      print('Erro ao obter estatísticas semanais: $e');
      return {
        'dailyCount': <String, int>{},
        'totalWeek': 0,
        'startDate': DateTime.now(),
        'endDate': DateTime.now(),
      };
    }
  }

  static String _getPriorityName(int priority) {
    switch (priority) {
      case 1: return 'Não urgente';
      case 2: return 'Pouco urgente';
      case 3: return 'Urgente';
      case 4: return 'Muito urgente';
      case 5: return 'Emergência';
      default: return 'Desconhecido';
    }
  }

  static String _getDayName(int weekday) {
    switch (weekday) {
      case 1: return 'Seg';
      case 2: return 'Ter';
      case 3: return 'Qua';
      case 4: return 'Qui';
      case 5: return 'Sex';
      case 6: return 'Sáb';
      case 7: return 'Dom';
      default: return 'Desconhecido';
    }
  }
}