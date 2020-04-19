// Obtem a lista de monitores de um curso
import 'package:app_distribuida2/providers/monitores.provider.dart';
import 'package:app_distribuida2/models/monitores.model.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/utils/alert.dart';

Future<List<Monitores>> getMonitores(context) async {
  ApiResponse<List<Monitores>> response = await MonitoresApi.getMonitores();

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}
