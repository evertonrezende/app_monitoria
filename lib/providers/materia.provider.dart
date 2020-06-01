import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:sqflite/sqflite.dart';

class MateriaApi extends ApiProvider {

  // Retorna as matérias cadastradas no sistema de uma disciplina
  static Future<ApiResponse<List<Materia>>> getMaterias(int id_disciplina) async {
    try {
      Database db = await ApiProvider.getDatabase();
      List<Map> mapResponse = await db.query('materias', where: "id_disciplina = ?", whereArgs: [id_disciplina]);

      //Recebe a string no formato json e transforma no formato Map
      if(mapResponse.isNotEmpty) {      
        final materias = mapResponse.map((m) => Materia.fromJson(m)).toList();
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