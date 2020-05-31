class Usuario {
  int id;
  String login;
  String nome;
  String senha;
  String token;
  bool isMonitor;

  Usuario(this.login, this.nome, this.senha, this.token, this.isMonitor);

  Usuario.fromJson(Map<String,dynamic> map):
      id = int.parse(map["id"].toString()),
      login = map["login"],
      nome = map["nome"],
      senha = map["senha"],
      isMonitor = map["isMonitor"].toString() == 'true' || map["isMonitor"].toString() == '1'? true : false,
      token = map["token"];

   toJson() {
    return <String, dynamic> {
      'id': id,
      'login': login,
      'nome': nome,
      'senha': senha,
      'token': token,
      'isMonitor': isMonitor
    };
  }
  
  @override
  String toString() {
    print( '{"id": "$id", "login": "$login", "nome": "$nome", "senha": "$senha", "token": "$token", "isMonitor": "$isMonitor"}');
    return '{"id": "$id", "login": "$login", "nome": "$nome", "senha": "$senha", "token": "$token", "isMonitor": "$isMonitor"}';
  }
}