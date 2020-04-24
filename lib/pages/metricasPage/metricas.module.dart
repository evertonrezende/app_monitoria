// Obtem a lista de monitores de um curso
import 'package:app_distribuida2/providers/monitor.provider.dart';
import 'package:app_distribuida2/models/monitor.model.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/utils/alert.dart';

// Obtém dados de métricas
Future<List<Monitor>> getMonitores(context) async {
  ApiResponse<List<Monitor>> response = await MonitorApi.getMonitores();

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return null;
  }

  return response.result;
}
