import 'package:app_distribuida2/models/metrica.model.dart';
import 'package:app_distribuida2/providers/metricas.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/utils/alert.dart';

// Obtém dados de métricas
Future<List<Metrica>> getDuvidasResolvidas(context) async {
  ApiResponse<List<Metrica>> response = await MetricasApi.getIndiceDuvidasResolvidas();

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}
// Obtém dados de métricas
Future<List<Metrica>> getDuvidasNaoResolvidas(context) async {
  ApiResponse<List<Metrica>> response = await MetricasApi.getIndiceDuvidasNaoResolvidas();

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}
// Obtém dados de métricas
Future<List<Metrica>> getIndiceMateriasMaisDuvidas(context) async {
  ApiResponse<List<Metrica>> response = await MetricasApi.getIndiceMateriasMaisDuvidas();

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}

String getMonthSync(int month) {
  switch(month) {
    case 1:
      return "Janeiro";
    case 2:
      return "Fevereiro";
    case 3:
      return "Março";
    case 4:
      return "Abril";
    case 5:
      return "Maio";
    case 6:
      return "Junho";
    case 7:
      return "Julho";
    case 8:
      return "Agosto";
    case 9:
      return "Setembro";
    case 10:
      return "Outubro";
    case 11:
      return "Novembro";
    default:
      return "Dezembro";
  }
}
