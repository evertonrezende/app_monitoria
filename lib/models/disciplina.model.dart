class Disciplina {
  int id;
  String nome;  
  bool favorita = false;

  Disciplina.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      nome = map["nome"];
}