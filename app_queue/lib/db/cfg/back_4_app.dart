class BackKeys {
  // IMPORTANTE: Mova essas chaves para variáveis de ambiente em produção
  final keyApplicationId = const String.fromEnvironment('BACK4APP_APP_ID', 
    defaultValue: '<your_app_id>');
  final keyClientKey = const String.fromEnvironment('BACK4APP_CLIENT_KEY', 
    defaultValue: '<your_client_key>');
  final restApiKey = const String.fromEnvironment('BACK4APP_REST_API_KEY', 
    defaultValue: '<your_rest_api_key>');
  final keyParseServerUrl = 'https://parseapi.back4app.com';
}
