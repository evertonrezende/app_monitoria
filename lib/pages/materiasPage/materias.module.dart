import 'package:app_distribuida2/models/materia.model.dart';

// Obtem a lista de materias de uma disciplina
List<Materia> getMaterias(context, idDisciplina) {
  List<Materia> materias = new List<Materia>();
  materias.add(Materia.fromJson({'id': 1, 'nome': 'Algoritmos de Ordenação'}));
  materias.add(Materia.fromJson({'id': 2, 'nome': 'Lista'}));
  materias.add(Materia.fromJson({'id': 3, 'nome': 'Fila'}));
  materias.add(Materia.fromJson({'id': 4, 'nome': 'Recursividade'}));
  materias.add(Materia.fromJson({'id': 5, 'nome': 'Árvores Binárias'}));

  return materias;
}
