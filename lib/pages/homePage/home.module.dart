import 'package:app_distribuida2/providers/disciplina.provider.dart';
import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/utils/alert.dart';

// Lista todas as disciplinas
Future<List<Disciplina>> getDisciplinas(context, [favoritas = false]) async {
  ApiResponse<List<Disciplina>> response = await DisciplinaApi.getDisciplinas();

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return [];
  }

  return response.result;
}
