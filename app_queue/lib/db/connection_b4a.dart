import 'dart:developer';

import 'package:app_queue/cfg/back_4_app.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class B4App {
  final BackKeys keys = BackKeys();
  final Parse _parse = Parse();
  bool state = false;
  String error = '';

  void initParse() {
    try {
      _parse.initialize(
        keys.keyApplicationId,
        keys.keyParseServerUrl,
        clientKey: keys.keyClientKey,
        debug: true,
        autoSendSessionId: true,
      );
    } catch (e) {
      error = e.toString();
      state = false;
      log('Erro ao inicializar Parse: $error');
    }
  }
}
