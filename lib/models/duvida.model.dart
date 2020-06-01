class Duvida {
  int id;
  int id_aluno;
  int id_materia;
  String assunto;  
  String resposta;  
  bool util;

  Duvida(this.id_aluno, this.id_materia, this.assunto, this.resposta, this.util);

  Duvida.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      id_aluno = map["id_aluno"],
      id_materia = map["id_materia"],
      assunto = map["assunto"],
      resposta = map["resposta"],
      util = _boolParse(map["util"]);

   toJson() {
    return <String, dynamic> {
      'id': id,
      'id_aluno': id_aluno,
      'id_materia': id_materia,
      'assunto': assunto,
      'resposta': resposta,
      'util': util
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