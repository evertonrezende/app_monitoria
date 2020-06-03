
import 'package:app_distribuida2/providers/conteudo.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/utils/alert.dart';

Future<dynamic> setFeedback(context, int id_conteudo, bool util) async {
  ApiResponse<dynamic> response = await ConteudoApi.setFeedback(id_conteudo, util);

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}
