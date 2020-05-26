
import 'package:app_distribuida2/providers/duvida.provider.dart';
import 'package:app_distribuida2/models/duvida.model.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/utils/alert.dart';

Future<List<Duvida>> getDuvidas(context) async {
  ApiResponse<List<Duvida>> response = await DuvidaApi.getDuvidas();

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}
