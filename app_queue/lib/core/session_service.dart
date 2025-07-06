import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class SessionService {
  static Future<bool> isSessionValid() async {
    try {
      final user = await ParseUser.currentUser() as ParseUser?;
      if (user == null) return false;
      
      final response = await user.getUpdatedUser();
      return response.success;
    } catch (e) {
      return false;
    }
  }

  static Future<void> refreshSession() async {
    try {
      final user = await ParseUser.currentUser() as ParseUser?;
      if (user != null) {
        await user.getUpdatedUser();
      }
    } catch (e) {
      // Session expired, redirect to login
      throw SessionExpiredException();
    }
  }
}

class SessionExpiredException implements Exception {
  final String message = 'Sessão expirada. Faça login novamente.';
}