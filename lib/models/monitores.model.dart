class Monitores {
  int id;
  String nome;  

  Monitores.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      nome = map["nome"];
}