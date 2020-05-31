import 'package:app_distribuida2/providers/api.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/models/usuario.model.dart';
import 'package:sqflite/sqflite.dart';

class LoginApi extends ApiProvider {

  // Realiza o login do usuário na plataforma
  static Future<ApiResponse<Usuario>> login(String login, String senha) async {
    try {
      Database db = await ApiProvider.getDatabase();
      List<Map> mapResponse = await db.query('usuarios',
        where: 'login = ? AND senha = ?', whereArgs: [login, senha], limit: 1);

      //Recebe a string no formato json e transforma no formato Map
      if(mapResponse.length > 0) {      
        final user = Usuario.fromJson(mapResponse.first);
        return ApiResponse.ok(user);
      }

      return ApiResponse.error("Login ou senha incorretos!");
    } 
    catch (error) {
      return ApiResponse.error("Não foi possível fazer o login");
    }
  }
}
