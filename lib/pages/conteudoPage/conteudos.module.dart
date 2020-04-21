import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/models/conteudo.model.dart';
import 'package:app_distribuida2/providers/conteudo.provider.dart';
import 'package:app_distribuida2/utils/alert.dart';

// Retorna o conteúdo de uma matéria
Future<List<Conteudo>> getConteudos(context, id_materia) async {
  ApiResponse<List<Conteudo>> response = await ConteudoApi.getConteudos(id_materia);

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}