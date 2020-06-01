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

      //Recebe a string no formato json e transforma no formato Map
      if(mapResponse.isNotEmpty) {      
        final disciplinas = mapResponse.map((m) => Disciplina.fromJson(m)).toList();
        return ApiResponse.ok(disciplinas);
      }

      // error é o que é retornado da API caso o login ou senha esteja incorreto
      return ApiResponse.error("Não foi possível recuperar as disciplinas");
    } 
    catch (error) {
      return ApiResponse.error("Não foi possível recuperar as disciplinas");
    }
  }
}
