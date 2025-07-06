class AppConstants {
  // Configurações da aplicação
  static const String appName = 'App-Queue';
  static const String appVersion = '1.0.0';
  
  // Configurações de UI
  static const double defaultPadding = 16.0;
  static const double defaultBorderRadius = 8.0;
  
  // Configurações de validação
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 20;
  
  // Mensagens de erro padrão
  static const String genericErrorMessage = 'Ocorreu um erro inesperado. Tente novamente.';
  static const String networkErrorMessage = 'Erro de conexão. Verifique sua internet.';
  static const String authErrorMessage = 'Erro de autenticação. Verifique suas credenciais.';
  
  // Rotas
  static const String loginRoute = '/login';
  static const String cadastroRoute = '/cadastro';
  static const String initialRoute = '/initial';
  static const String homeRoute = '/home';
  
  // Configurações do Parse
  static const String parseServerUrl = 'https://parseapi.back4app.com';
  static const bool parseDebugMode = true;
}