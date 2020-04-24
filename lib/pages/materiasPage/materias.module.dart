import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/providers/materia.provider.dart';
import 'package:app_distribuida2/utils/alert.dart';

// Obtem a lista de materias de uma disciplina
Future<List<Materia>> getMaterias(context, idDisciplina) async {
  ApiResponse<List<Materia>> response = await MateriaApi.getMaterias(idDisciplina);

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}
