import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';

class MateriaApi extends ApiProvider {

  // Retorna as matérias cadastradas no sistema de uma disciplina
  static Future<ApiResponse<List<Materia>>> getMaterias(int id_disciplina) async {
    //Tratamento de exceção em caso de indisponibilidades da rede
    try {
      //Recebe a string no formato json e transforma no formato Map
      List<Materia> mapResponse = new List<Materia>();
      mapResponse
          .add(Materia.fromJson({'id': 1, 'nome': 'Algoritmos de Ordenação'}));
      mapResponse.add(Materia.fromJson({'id': 2, 'nome': 'Lista'}));
      mapResponse.add(Materia.fromJson({'id': 3, 'nome': 'Fila'}));
      mapResponse.add(Materia.fromJson({'id': 4, 'nome': 'Recursividade'}));
      mapResponse.add(Materia.fromJson({'id': 5, 'nome': 'Árvores Binárias'}));

      return ApiResponse.ok(mapResponse);
    } catch (error) {
      //Esse tratamento é uma mensagem genérica em caso de perda de conexão, problema do webservice, etc...
      return ApiResponse.error("Não foi possível recuperar as matérias");
    }
  }
}