class Monitor {
  int id;
  String nome;  

  Monitor.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      nome = map["nome"];
}