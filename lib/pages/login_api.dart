
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<bool> login(String login, String senha) async{
    var url = 'http://livrowebservices.com.br/rest/login';

    Map params = {
      'login': login,
      'senha': senha,
    };

    var response = await http.post(url, body: params); //aguarda um retorn da requisição

    print('Response status: ${response.statusCode}');
    print('Response status: ${response.body}');
    return true;
  }
}