import 'package:app_distribuida2/models/conteudo.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';

import 'package:sqflite/sqflite.dart';

class ConteudoApi extends ApiProvider {
  // Retorna a conteúdo de uma matéria cadastrada no sistema
  static Future<ApiResponse<List<Conteudo>>> getConteudos(int id_materia) async {
    try {
      Database db = await ApiProvider.getDatabase();
      List<Map> mapResponse = await db.query('conteudos', where: "id_materia  = ?", whereArgs: [id_materia]);

      //Recebe a string no formato json e transforma no formato Map
      if(mapResponse.isNotEmpty) {      
        final conteudos = mapResponse.map((m) => Conteudo.fromJson(m)).toList();
        return ApiResponse.ok(conteudos);
      }

      // error é o que é retornado da API caso o login ou senha esteja incorreto
      return ApiResponse.error("Não foi possível recuperar os conteúdos");
    } 
    catch (error) {
      return ApiResponse.error("Não foi possível recuperar os conteúdos");
    }
  }
}
