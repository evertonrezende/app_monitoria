class Disciplina {
  int id;
  String nome;  
  bool favorita = false;

  Disciplina(this.nome, this.favorita);

  Disciplina.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      nome = map["nome"],
      favorita = map["favorita"].toString() == 'true' || map["favorita"].toString() == '1'? true : false;

   toJson() {
    return <String, dynamic> {
      'id': id,
      'nome': nome,
      'favorita': favorita
    };
   }
}