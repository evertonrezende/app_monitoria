class Conteudo {
  int id;
  String nome;  

  Conteudo.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      nome = map["conteudo"];
}