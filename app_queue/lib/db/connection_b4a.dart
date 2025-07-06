import 'dart:developer';

import 'package:app_queue/db/cfg/back_4_app.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class B4App {
  final BackKeys keys = BackKeys();
  final Parse _parse = Parse();
  bool state = false;
  String error = '';

  Future<bool> initParse() async {
    try {
      await _parse.initialize(
        keys.keyApplicationId,
        keys.keyParseServerUrl,
        clientKey: keys.keyClientKey,
        debug: true,
        autoSendSessionId: true,
      );
      state = true;
      log('Parse inicializado com sucesso');
      return true;
    } catch (e) {
      error = e.toString();
      state = false;
      log('Erro ao inicializar Parse: $error');
      return false;
    }
  }

  bool get isInitialized => state;
  String get lastError => error;
}
