
import 'package:app_distribuida2/providers/duvida.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/utils/alert.dart';

Future<dynamic> setDuvidaUtil(context, int id_duvida, bool util) async {
  ApiResponse<dynamic> response = await DuvidaApi.setDuvidaUtil(id_duvida, util);

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}
