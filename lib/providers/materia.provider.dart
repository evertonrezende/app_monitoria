import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/providers/conteudo.provider.dart';
import 'package:sqflite/sqflite.dart';

class MateriaApi extends ApiProvider {

  // Retorna as matérias cadastradas no sistema de uma disciplina
  static Future<ApiResponse<List<Materia>>> getMaterias(int id_disciplina) async {
    try {
      Database db = await ApiProvider.getDatabase();
      List<Map> mapResponse = await db.query('materias', where: "id_disciplina = ?", whereArgs: [id_disciplina]);

      //Recebe a string no formato json e transforma no formato Map
      if(mapResponse.isNotEmpty) {   
        List<Materia> materias = new List<Materia>();
        for(int i = 0; i < mapResponse.length; i++) {
          Materia m = Materia.fromJson(mapResponse[i]);

          m.conteudos = (await ConteudoApi.getConteudos(m.id)).result;
          materias.add(m);
        }
        return ApiResponse.ok(materias);
      }

      // error é o que é retornado da API caso o login ou senha esteja incorreto
      return ApiResponse.error("Não foi possível recuperar as matérias");
    } 
    catch (error) {
      return ApiResponse.error("Não foi possível recuperar as matérias");
    }
  }
}

