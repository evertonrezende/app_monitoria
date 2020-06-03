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
  
  // Seta a resposta da dúvida como útil
  static Future<ApiResponse<dynamic>> setFeedback(int id_conteudo, bool util) async {   
    try {      
      Database db = await ApiProvider.getDatabase();
      List<Map> mapResponse = await db.query('conteudos', where: "id = ?", whereArgs: [id_conteudo], limit: 1);

      if(mapResponse.isNotEmpty) {
        Conteudo c = Conteudo.fromJson(mapResponse.first);
        Map<String, int> atualizacao = util? {"likes": (c.likes + 1)} : {"deslikes": (c.deslikes + 1)};
        await db.update('conteudos', atualizacao, where: "id = ?", whereArgs: [id_conteudo]);
      }
      
      return ApiResponse.ok(true);
    } 
    catch (error) {
      return ApiResponse.error("Não foi possível salvar o feedback.");
    }
  }
}
