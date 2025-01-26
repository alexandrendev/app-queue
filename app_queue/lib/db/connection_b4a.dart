import 'package:app_queue/cfg/back_4_app.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

Future<bool> initB4A() async {

  final Back4App cfg = Back4App();

  final String keyApplicationId = cfg.keyApplicationId;
  final String keyClientKey = cfg.keyClientKey;
  final String keyParseServerUrl = cfg.keyParseServerUrl;

  await Parse().initialize(
    keyApplicationId,
    keyParseServerUrl,
    clientKey: keyClientKey,
    debug: true,
  );

  ParseResponse healthCheck = (await Parse().healthCheck());

  if (healthCheck.success) {
    return true;
  }
  return false;
}