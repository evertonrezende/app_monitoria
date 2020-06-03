import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/providers/conteudo.provider.dart';
import 'package:app_distribuida2/providers/disciplina.provider.dart';
import 'package:sqflite/sqflite.dart';

class MateriaApi extends ApiProvider {

  // Retorna as matérias cadastradas de uma disciplina no sistema
  static Future<ApiResponse<List<Materia>>> getMaterias(int id_disciplina) async {
    try {
      Database db = await ApiProvider.getDatabase();
      List<Map> mapResponse = await db.query('materias', where: "id_disciplina = ?", whereArgs: [id_disciplina]);

      if(mapResponse.isNotEmpty) {   
        List<Materia> materias = new List<Materia>();
        for(int i = 0; i < mapResponse.length; i++) {
          Materia m = Materia.fromJson(mapResponse[i]);

          m.conteudos = (await ConteudoApi.getConteudos(m.id)).result;
          materias.add(m);
        }
        return ApiResponse.ok(materias);
      }

      return ApiResponse.error("Não foi possível recuperar as matérias");
    } 
    catch (error) {
      return ApiResponse.error("Não foi possível recuperar as matérias");
    }
  }

  
  // Retorna a matéria cadastrada no sistema com sua disciplina
  static Future<ApiResponse<Materia>> getMateria(int id_materia) async {
    try {
      Database db = await ApiProvider.getDatabase();
      List<Map> mapResponse = await db.query('materias', where: "id = ?", whereArgs: [id_materia], limit: 1);

      if(mapResponse.isNotEmpty) {   
        Materia materia = Materia.fromJson(mapResponse.first);
        materia.disciplina = (await DisciplinaApi.getDisciplina(materia.id_disciplina)).result;
        
        return ApiResponse.ok(materia);
      }

      return ApiResponse.error("Não foi possível recuperar as matérias");
    } 
    catch (error) {
      return ApiResponse.error("Não foi possível recuperar as matérias");
    }
  }
}

