class Materia {
  int id;
  String nome;  

  Materia.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      nome = map["nome"];
}