import 'package:app_distribuida2/models/duvida.model.dart';
import 'package:app_distribuida2/models/usuario.model.dart';
import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/providers/materia.provider.dart';
import 'package:app_distribuida2/utils/appStorage.dart';
import 'package:sqflite/sqflite.dart';

class DuvidaApi extends ApiProvider {
  
  // Retorna as dúvidas cadastradas no sistema
  static Future<ApiResponse<List<Duvida>>> getDuvidas() async {
    try {
      Database db = await ApiProvider.getDatabase();
      List<Map> mapResponse = await db.query('duvidas');

      if(mapResponse.isNotEmpty) {     
        List<Duvida> duvidas = new List<Duvida>();
        for(int i = 0; i < mapResponse.length; i++){
          Duvida d = Duvida.fromJson(mapResponse[i]);
          d.materia = (await MateriaApi.getMateria(d.id)).result;

          duvidas.add(d);
        }
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

  // Seta a resposta da dúvida como útil
  static Future<ApiResponse<dynamic>> setDuvidaUtil(int id_duvida, bool util) async {   
    try {
      Map<String, bool> atualizacao = {"util": util};

      Database db = await ApiProvider.getDatabase();
      await db.update('duvidas', atualizacao, where: "id = ?", whereArgs: [id_duvida]);

      
      return ApiResponse.ok(true);
    } 
    catch (error) {
      return ApiResponse.error("Não foi possível marcar a disciplina como favorita");
    }
  }
}







