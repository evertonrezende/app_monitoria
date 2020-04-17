import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/api-response.model.dart';
import 'package:app_distribuida2/models/usuario.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginApi extends ApiProvider {

  // Realiza o login do usuário na plataforma
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    //Tratamento de exceção em caso de indisponibilidades da rede
    try {
      var response = await http.post(
        "${ApiProvider.API_TEST}/login",
        body: ApiProvider.createStringRequestSync({"username": login, "password": senha}),
        headers: ApiProvider.createHeaderSync());

      //Recebe a string no formato json e transforma no formato Map
      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);
        return ApiResponse.ok(user);
      }

      // error é o que é retornado da API caso o login ou senha esteja incorreto
      return ApiResponse.error(mapResponse["error"]);
    } 
    catch (error) {
      //Esse tratamento é uma mensagem genérica em caso de perda de conexão, problema do webservice, etc...
      return ApiResponse.error("Não foi possível fazer o login");
    }
  }
}
