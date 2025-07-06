import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static const String _keyPatients = 'cached_patients';
  static const String _keyFichas = 'cached_fichas';
  static const String _keyLastUpdate = 'last_update_';

  static Future<void> cachePatients(List<Map<String, dynamic>> patients) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyPatients, jsonEncode(patients));
    await prefs.setString('${_keyLastUpdate}patients', DateTime.now().toIso8601String());
  }

  static Future<List<Map<String, dynamic>>?> getCachedPatients() async {
    final prefs = await SharedPreferences.getInstance();
    final cached = prefs.getString(_keyPatients);
    if (cached != null) {
      return List<Map<String, dynamic>>.from(jsonDecode(cached));
    }
    return null;
  }

  static Future<void> cacheFichas(List<Map<String, dynamic>> fichas) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyFichas, jsonEncode(fichas));
    await prefs.setString('${_keyLastUpdate}fichas', DateTime.now().toIso8601String());
  }

  static Future<List<Map<String, dynamic>>?> getCachedFichas() async {
    final prefs = await SharedPreferences.getInstance();
    final cached = prefs.getString(_keyFichas);
    if (cached != null) {
      return List<Map<String, dynamic>>.from(jsonDecode(cached));
    }
    return null;
  }

  static Future<bool> isCacheExpired(String key, {int maxAgeMinutes = 30}) async {
    final prefs = await SharedPreferences.getInstance();
    final lastUpdateStr = prefs.getString('${_keyLastUpdate}$key');
    if (lastUpdateStr == null) return true;

    final lastUpdate = DateTime.parse(lastUpdateStr);
    final now = DateTime.now();
    return now.difference(lastUpdate).inMinutes > maxAgeMinutes;
  }

  static Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyPatients);
    await prefs.remove(_keyFichas);
    await prefs.remove('${_keyLastUpdate}patients');
    await prefs.remove('${_keyLastUpdate}fichas');
  }
}