import 'package:app_distribuida2/models/perguntaFrequente.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';

class PerguntaFrequenteApi extends ApiProvider {
  
  // Retorna as perguntas frequentes cadastradas no sistema
  static Future<ApiResponse<List<PerguntaFrequente>>> getPerguntasFrequentes() async {
    //Tratamento de exceção em caso de indisponibilidades da rede
    try {
      //Recebe a string no formato json e transforma no formato Map
      List<PerguntaFrequente> mapResponse = new List<PerguntaFrequente>();
      mapResponse.add(PerguntaFrequente.fromJson({"id": 1, "titulo": "O que é uma estrutura de pilha?", "resposta": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ex est, aliquet posuere blandit nec, scelerisque at magna. Vivamus a commodo libero, sed efficitur dui."}));
      mapResponse.add(PerguntaFrequente.fromJson({"id": 2, "titulo": "Como implementar uma pilha?", "resposta": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ex est, aliquet posuere blandit nec, scelerisque at magna. Vivamus a commodo libero, sed efficitur dui."}));
      mapResponse.add(PerguntaFrequente.fromJson({"id": 3, "titulo": "O que é uma estrutura de Fila?", "resposta": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ex est, aliquet posuere blandit nec, scelerisque at magna. Vivamus a commodo libero, sed efficitur dui."}));

      return ApiResponse.ok(mapResponse);
    } catch (error) {
      //Esse tratamento é uma mensagem genérica em caso de perda de conexão, problema do webservice, etc...
      return ApiResponse.error("Não foi possível recuperar as perguntas frequentes");
    }
  }
}
