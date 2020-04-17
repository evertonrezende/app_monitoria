class Disciplina {
  int id;
  String nome;  

  Disciplina.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      nome = map["nome"];
}