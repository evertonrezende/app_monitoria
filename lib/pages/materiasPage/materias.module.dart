import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/providers/disciplina.provider.dart';
import 'package:app_distribuida2/providers/materia.provider.dart';
import 'package:app_distribuida2/utils/alert.dart';

// Obtem a lista de materias de uma disciplina
Future<List<Materia>> getMaterias(context, int idDisciplina) async {
  ApiResponse<List<Materia>> response = await MateriaApi.getMaterias(idDisciplina);

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}

// Obtem a lista de materias de uma disciplina
Future<dynamic> setDisciplinaFavorita(context, int idDisciplina, bool favorita) async {
  ApiResponse<dynamic> response = await DisciplinaApi.setDisciplinaFavorita(idDisciplina, favorita);

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}
