class PerguntaFrequente {
  int id;
  String titulo;  
  String resposta;  

  PerguntaFrequente.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      titulo = map["titulo"],
      resposta = map["resposta"];
}