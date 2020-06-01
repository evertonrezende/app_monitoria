import 'package:app_distribuida2/models/duvida.model.dart';
import 'package:app_distribuida2/models/usuario.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/utils/appStorage.dart';
import 'package:sqflite/sqflite.dart';

class DuvidaApi extends ApiProvider {
  
  // Retorna as dúvidas cadastradas no sistema
  static Future<ApiResponse<List<Duvida>>> getDuvidas() async {
    //Tratamento de exceção em caso de indisponibilidades da rede
    try {
      Database db = await ApiProvider.getDatabase();
      List<Map> mapResponse = await db.query('duvidas');

      //Recebe a string no formato json e transforma no formato Map
      if(mapResponse.isNotEmpty) {      
        final duvidas = mapResponse.map((m) => Duvida.fromJson(m)).toList();
        return ApiResponse.ok(duvidas);
      }

      return ApiResponse.error("Houve um erro ao recuperar as dúvidas.");
    } catch (error) {
      return ApiResponse.error("Houve um erro ao recuperar as dúvidas.");
    }
  }

  // Salva uma dúvida
  static Future<ApiResponse<dynamic>> postDuvida(String assunto, int id_materia) async {   
    try {       
      Usuario user = await AppStorage.getCurrentUser();
      Database db = await ApiProvider.getDatabase();
      Duvida d = new Duvida(user.id, id_materia, assunto, null, null);

      await db.insert('duvidas', d.toJson());

      return ApiResponse.ok(true);
    } catch (error) {
      return ApiResponse.error("Houve um erro ao recuperar as dúvidas.");
    }
  }
}







