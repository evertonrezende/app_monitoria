import 'package:app_distribuida2/.env.dart' as env;
import 'dart:convert';

class ApiProvider {
  static var API_URL = env.environment['API_URL'];
  static var API_TEST = env.environment['API_TEST'];
  static var API_TEST2 = env.environment['API_TEST2'];
  // Cria um cabeçalho para uma requisição
  static createHeaderSync([bool isAuthenticated = false, String token]) {
    Map<String, String> header;

    if(isAuthenticated)
      header = {"Content-Type": "application/json", "Authorization": "Bearer $token"};
    else
      header = {"Content-Type": "application/json"};

    return header;
  }

  // Cria uma requisição no formato de String
  static createStringRequestSync(Map<String, String> requisicao) {
    return json.encode(requisicao);
  }
}
