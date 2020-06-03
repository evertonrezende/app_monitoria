import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:sqflite/sqflite.dart';


class DisciplinaApi extends ApiProvider {

  // Retorna as disciplinas cadastradas no sistema
  static Future<ApiResponse<List<Disciplina>>> getDisciplinas() async {
    try {
      Database db = await ApiProvider.getDatabase();
      List<Map> mapResponse = await db.query('disciplinas');

      if(mapResponse.isNotEmpty) {      
        final disciplinas = mapResponse.map((m) => Disciplina.fromJson(m)).toList();
        return ApiResponse.ok(disciplinas);
      }

      return ApiResponse.error("Não foi possível recuperar as disciplinas");
    } 
    catch (error) {
      return ApiResponse.error("Não foi possível recuperar as disciplinas");
    }
  }
  
  // Retorna as disciplinas cadastradas no sistema
  static Future<ApiResponse<dynamic>> setDisciplinaFavorita(int id_disciplina, bool favorita) async {
    try {
      Database db = await ApiProvider.getDatabase();
      Map<String, bool> values = {"favorita": favorita};
      await db.update('disciplinas', values, where: "id = ?", whereArgs: [id_disciplina]);

      
      return ApiResponse.ok(true);
    } 
    catch (error) {
      return ApiResponse.error("Não foi possível marcar a disciplina como favorita");
    }
  }
  
  // Retorna uma disciplina cadastrada no sistema
  static Future<ApiResponse<Disciplina>> getDisciplina(int id_disciplina) async {
    try {
      Database db = await ApiProvider.getDatabase();
      List<Map> mapResponse = await db.query('disciplinas', where: "id = ?", whereArgs: [id_disciplina], limit: 1);

      if(mapResponse.isNotEmpty) {      
        Disciplina disciplina = Disciplina.fromJson(mapResponse.first);
        return ApiResponse.ok(disciplina);
      }

      return ApiResponse.error("Não foi possível recuperar a disciplina");
    } 
    catch (error) {
      return ApiResponse.error("Não foi possível recuperar a disciplina");
    }
  }
}
