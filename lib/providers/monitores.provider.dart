import 'package:app_distribuida2/models/monitores.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';

class MonitoresApi extends ApiProvider {
  // Realiza o login do usuário na plataforma
  static Future<ApiResponse<List<Monitores>>> getMonitores() async {
    //Tratamento de exceção em caso de indisponibilidades da rede
    try {
      //Recebe a string no formato json e transforma no formato Map
      List<Monitores> mapResponse = new List<Monitores>();
      mapResponse.add(Monitores.fromJson({"id": 1, "nome": "André Maglhães"}));
      mapResponse.add(Monitores.fromJson({"id": 2, "nome": "Jorge Batista"}));
      mapResponse.add(Monitores.fromJson({"id": 3, "nome": "Zoey Trivellato"}));

      // final disciplinas =
      //     mapResponse.map((m) => Monitores.fromJson(m)).toList();
      return ApiResponse.ok(mapResponse);
    } catch (error) {
      //Esse tratamento é uma mensagem genérica em caso de perda de conexão, problema do webservice, etc...
      return ApiResponse.error("Não foi possível recuperar os monitores");
    }
  }
}
