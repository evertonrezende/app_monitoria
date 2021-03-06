import 'package:app_distribuida2/models/disciplina.model.dart';
import 'conteudo.model.dart';

class Materia {
  int id;
  int id_disciplina;
  String nome; 

  Disciplina disciplina;
  List<Conteudo> conteudos;

  Materia(this.nome, this.id_disciplina, {this.id});

  Materia.fromJson(Map<String,dynamic> map):  
      id = map["id"],
      nome = map["nome"],
      id_disciplina = map["id_disciplina"];

   toJson() {
    return <String, dynamic> {
      'id': id,
      'nome': nome,
      'id_disciplina': id_disciplina
    };
   }
}