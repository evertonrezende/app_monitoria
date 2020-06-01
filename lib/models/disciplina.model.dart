class Disciplina {
  int id;
  String nome;  
  bool favorita = false;

  Disciplina(this.nome, this.favorita, {this.id});

  Disciplina.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      nome = map["nome"],
      favorita = _boolParse(map["favorita"]);

   toJson() {
    return <String, dynamic> {
      'id': id,
      'nome': nome,
      'favorita': favorita
    };
   }
   
   static _boolParse(value) {
     if(value == null)
      return null;

     if(value.toString() == 'true' || value.toString() == "1")
      return true;

     return false;
   }
}