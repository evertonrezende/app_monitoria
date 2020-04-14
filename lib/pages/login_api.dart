import 'dart:convert';
import 'package:app_distribuida2/pages/api_response.dart';
import 'package:app_distribuida2/pages/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String login, String senha) async{

    //Tratamento de exceção em caso de indisponibilidades da rede
   
    try {
      var url = 'https://carros-springboot.herokuapp.com/api/v2/login';

    Map<String,String> headers = {
      "Content-Type": "application/json"
    };

    
    Map params = {
	    "username": login,
	    "password": senha
    };

    //Conversao para String
    String s = json.encode(params);

    var response = await http.post(url, body: s, headers: headers); //aguarda um retorn da requisição

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');


//recebe a string no formato json e transforma no formato Map
    Map mapResponse = json.decode(response.body);

    if(response.statusCode == 200){
       final user = Usuario.fromJson(mapResponse);
       return ApiResponse.ok(user);
    }
    

    // error é o que é retornado da API caso o login ou senha esteja incorreto
    return ApiResponse.error(mapResponse["error"]);
    } catch(error, exception){
          print("Erro no login $error > $exception");

          //esse tratamento é uma mensagem genérica em caso de perda de conexão, problema do webservice, etc...
          return ApiResponse.error("Não foi possível fazer o login");
    }
  }
}