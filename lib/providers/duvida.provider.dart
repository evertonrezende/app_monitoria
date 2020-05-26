import 'package:app_distribuida2/models/duvida.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';

class DuvidaApi extends ApiProvider {
  
  // Retorna as dúvidas cadastradas no sistema
  static Future<ApiResponse<List<Duvida>>> getDuvidas() async {
    //Tratamento de exceção em caso de indisponibilidades da rede
    try {
      //Recebe a string no formato json e transforma no formato Map
      List<Duvida> mapResponse = new List<Duvida>();
      mapResponse.add(Duvida.fromJson({"id": 1, "titulo": "O que é uma estrutura de pilha?", "resposta": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ex est, aliquet posuere blandit nec, scelerisque at magna. Vivamus a commodo libero, sed efficitur dui."}));
      mapResponse.add(Duvida.fromJson({"id": 2, "titulo": "Como implementar uma pilha?", "resposta": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ex est, aliquet posuere blandit nec, scelerisque at magna. Vivamus a commodo libero, sed efficitur dui."}));
      mapResponse.add(Duvida.fromJson({"id": 3, "titulo": "O que é uma estrutura de Fila?", "resposta": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ex est, aliquet posuere blandit nec, scelerisque at magna. Vivamus a commodo libero, sed efficitur dui."}));
      mapResponse.add(Duvida.fromJson({"id": 4, "titulo": "O que é uma árvore?", "resposta": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ex est, aliquet posuere blandit nec, scelerisque at magna. Vivamus a commodo libero, sed efficitur dui."}));
      mapResponse.add(Duvida.fromJson({"id": 5, "titulo": "Como ordenar uma pilha?", "resposta": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ex est, aliquet posuere blandit nec, scelerisque at magna. Vivamus a commodo libero, sed efficitur dui."}));
      mapResponse.add(Duvida.fromJson({"id": 6, "titulo": "Como ordenar fila?", "resposta": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ex est, aliquet posuere blandit nec, scelerisque at magna. Vivamus a commodo libero, sed efficitur dui."}));
      mapResponse.add(Duvida.fromJson({"id": 7, "titulo": "Qual a diferença entre File e Pilha?", "resposta": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ex est, aliquet posuere blandit nec, scelerisque at magna. Vivamus a commodo libero, sed efficitur dui."}));
      mapResponse.add(Duvida.fromJson({"id": 8, "titulo": "O que é tratamento de colisão?", "resposta": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ex est, aliquet posuere blandit nec, scelerisque at magna. Vivamus a commodo libero, sed efficitur dui."}));

      return ApiResponse.ok(mapResponse);
    } catch (error) {
      //Esse tratamento é uma mensagem genérica em caso de perda de conexão, problema do webservice, etc...
      return ApiResponse.error("Não foi possível recuperar as dúvidas");
    }
  }
}







