import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/utils/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DisciplinaApi extends ApiProvider {

  // Realiza o login do usuário na plataforma
  static Future<ApiResponse<List<Disciplina>>> getDisciplinas() async {
    //Tratamento de exceção em caso de indisponibilidades da rede
    try {
      var response = await http.get(
        "${ApiProvider.API_URL}/Disciplinas",
        headers: ApiProvider.createHeaderSync());

      //Recebe a string no formato json e transforma no formato Map
      List mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final disciplinas = mapResponse.map((m) => Disciplina.fromJson(m)).toList();
        return ApiResponse.ok(disciplinas);
      }

      // error é o que é retornado da API caso o login ou senha esteja incorreto
      return ApiResponse.error("Não foi possível recuperar as disciplinas");
    } 
    catch (error) {
      //Esse tratamento é uma mensagem genérica em caso de perda de conexão, problema do webservice, etc...
      return ApiResponse.error("Não foi possível recuperar as disciplinas");
    }
  }
}
