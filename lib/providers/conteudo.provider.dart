import 'package:app_distribuida2/models/conteudo.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';

class ConteudoApi extends ApiProvider {
  // Retorna a conteúdo de uma matéria cadastrada no sistema
  static Future<ApiResponse<List<Conteudo>>> getConteudos(int id_materia) async {
    //Tratamento de exceção em caso de indisponibilidades da rede
    try {
      //Recebe a string no formato json e transforma no formato Map
      List<Conteudo> mapResponse = new List<Conteudo>();
      mapResponse
          .add(Conteudo.fromJson({'id': 1, 'nome': 'Algoritmos de Ordenação'}));
      mapResponse.add(Conteudo.fromJson({
        'id': 1,
        'nome': 'Conteúdo 1',
        'descricao': 'Descrição do conteúdo 1'
      }));
      mapResponse.add(Conteudo.fromJson({
        'id': 2,
        'nome': 'Conteúdo 2',
        'descricao': 'Descrição do conteúdo 2'
      }));
      mapResponse.add(Conteudo.fromJson({
        'id': 3,
        'nome': 'Conteúdo 3',
        'descricao': 'Descrição do conteúdo 3'
      }));
      mapResponse.add(Conteudo.fromJson({
        'id': 4,
        'nome': 'Conteúdo 4',
        'descricao': 'Descrição do conteúdo 4'
      }));
      mapResponse.add(Conteudo.fromJson({
        'id': 5,
        'nome': 'Conteúdo 5',
        'descricao': 'Descrição do conteúdo 5'
      }));

      return ApiResponse.ok(mapResponse);
    } catch (error) {
      //Esse tratamento é uma mensagem genérica em caso de perda de conexão, problema do webservice, etc...
      return ApiResponse.error("Não foi possível recuperar os conteúdos");
    }
  }
}
