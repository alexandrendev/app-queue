import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:app_queue/core/cache_service.dart';

class SyncService {
  static bool _isSyncing = false;
  
  static Future<bool> isOnline() async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  static Future<void> syncPendingData() async {
    if (_isSyncing || !await isOnline()) return;
    
    _isSyncing = true;
    try {
      // Implementar sincronização de dados pendentes
      await _syncPendingFichas();
      await _syncPendingPatients();
    } finally {
      _isSyncing = false;
    }
  }

  static Future<void> _syncPendingFichas() async {
    // Implementar lógica de sincronização
  }

  static Future<void> _syncPendingPatients() async {
    // Implementar lógica de sincronização
  }
}