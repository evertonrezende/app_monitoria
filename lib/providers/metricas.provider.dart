import 'package:app_distribuida2/models/metrica.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';

class MetricasApi extends ApiProvider {

  // Retorna métricas semanais sobre as dúvidas resolvidas
  static Future<ApiResponse<List<Metrica>>> getIndiceDuvidasResolvidas() async {
    try {
      //Recebe a string no formato json e transforma no formato Map
      List<Metrica> mapResponse = new List<Metrica>();
      mapResponse
          .add(Metrica.fromJson({'periodo': 'Sem. 01', 'valor': 3.0}));
      mapResponse
          .add(Metrica.fromJson({'periodo': 'Sem. 02', 'valor': 7.0}));
      mapResponse
          .add(Metrica.fromJson({'periodo': 'Sem. 03', 'valor': 2.0}));
      mapResponse
          .add(Metrica.fromJson({'periodo': 'Sem. 04', 'valor': 3.0}));
      mapResponse
          .add(Metrica.fromJson({'periodo': 'Sem. 05', 'valor': 1.0}));

      return ApiResponse.ok(mapResponse);
    } catch (error) {
      return ApiResponse.error("Não foi possível recuperar as métricas");
    }
  }

  // Retorna métricas semanais sobre as dúvidas não resolvidas
  static Future<ApiResponse<List<Metrica>>> getIndiceDuvidasNaoResolvidas() async {
    try {
      //Recebe a string no formato json e transforma no formato Map
      List<Metrica> mapResponse = new List<Metrica>();
      mapResponse
          .add(Metrica.fromJson({'periodo': 'Sem. 01', 'valor': 1.0}));
      mapResponse
          .add(Metrica.fromJson({'periodo': 'Sem. 02', 'valor': 0.3}));
      mapResponse
          .add(Metrica.fromJson({'periodo': 'Sem. 03', 'valor': 2.1}));
      mapResponse
          .add(Metrica.fromJson({'periodo': 'Sem. 04', 'valor': 0.0}));
      mapResponse
          .add(Metrica.fromJson({'periodo': 'Sem. 05', 'valor': 0.1}));

      return ApiResponse.ok(mapResponse);
    } catch (error) {
      return ApiResponse.error("Não foi possível recuperar as métricas");
    }
  }
  
  // Retorna métricas semanais sobre as matérias com mais dúvidas
  static Future<ApiResponse<List<Metrica>>> getIndiceMateriasMaisDuvidas() async {
    try {
      //Recebe a string no formato json e transforma no formato Map
      List<Metrica> mapResponse = new List<Metrica>();
      mapResponse
          .add(Metrica.fromJson({'periodo': 'AED', 'valor': 5.0}));
      mapResponse
          .add(Metrica.fromJson({'periodo': 'Grafos', 'valor': 1.0}));
      mapResponse
          .add(Metrica.fromJson({'periodo': 'ATP', 'valor': 4.0}));
      mapResponse
          .add(Metrica.fromJson({'periodo': 'POO', 'valor': 1.5}));
      mapResponse
          .add(Metrica.fromJson({'periodo': 'IHC', 'valor': 3.0}));

      return ApiResponse.ok(mapResponse);
    } catch (error) {
      return ApiResponse.error("Não foi possível recuperar as métricas");
    }
  }
}
