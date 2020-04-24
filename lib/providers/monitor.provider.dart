import 'package:app_distribuida2/models/monitor.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';

class MonitorApi extends ApiProvider {
  
  // Retorna os monitores cadastrados no sistema
  static Future<ApiResponse<List<Monitor>>> getMonitores() async {
    //Tratamento de exceção em caso de indisponibilidades da rede
    try {
      //Recebe a string no formato json e transforma no formato Map
      List<Monitor> mapResponse = new List<Monitor>();
      mapResponse.add(Monitor.fromJson({"id": 1, "nome": "André Maglhães"}));
      mapResponse.add(Monitor.fromJson({"id": 2, "nome": "Jorge Batista"}));
      mapResponse.add(Monitor.fromJson({"id": 3, "nome": "Zoey Trivellato"}));

      return ApiResponse.ok(mapResponse);
    } catch (error) {
      //Esse tratamento é uma mensagem genérica em caso de perda de conexão, problema do webservice, etc...
      return ApiResponse.error("Não foi possível recuperar os monitores");
    }
  }
}
