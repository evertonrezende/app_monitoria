// Obtem a lista de monitores de um curso
import 'package:app_distribuida2/providers/perguntaFrequente.provider.dart';
import 'package:app_distribuida2/models/perguntaFrequente.model.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/utils/alert.dart';

Future<List<PerguntaFrequente>> getperguntaFrequentees(context) async {
  ApiResponse<List<PerguntaFrequente>> response = await PerguntaFrequenteApi.getPerguntasFrequentes();

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}
