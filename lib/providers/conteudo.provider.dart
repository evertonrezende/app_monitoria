import 'package:app_distribuida2/models/conteudo.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConteudoApi extends ApiProvider {
  // Retorna a conteúdo de uma matéria cadastrada no sistema
  static Future<ApiResponse<List<Conteudo>>> getConteudos() async {
    //Tratamento de exceção em caso de indisponibilidades da rede
    try {
      var response = await http.get(
        "${ApiProvider.API_URL}/MaterialApoio",
        headers: ApiProvider.createHeaderSync()
      );
      List mapResponse = json.decode(response.body);
      if(response.statusCode == 200){
        final conteudos = mapResponse.map((c) => Conteudo.fromJson(c)).toList();
        return ApiResponse.ok(conteudos);
      }

      //return ApiResponse.error("Não foi possivel recuperar as disciplinas");
      //Recebe a string no formato json e transforma no formato Map
      

      return ApiResponse.ok(mapResponse);
    } catch (error) {
      //Esse tratamento é uma mensagem genérica em caso de perda de conexão, problema do webservice, etc...
      return ApiResponse.error("Não foi possível recuperar os conteúdos");
    }
  }
}
