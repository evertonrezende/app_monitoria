import 'package:app_distribuida2/models/metrica.model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final List<Metrica> _dados;
  final charts.Color colorBar;
  final bool animate;

  ChartBar(this._dados, {this.animate, this.colorBar});

  @override
  Widget build(BuildContext context) {
    List<charts.Series> seriesList = _createSeriesData(_dados);

    return new charts.BarChart(seriesList,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: new charts.OrdinalAxisSpec(),
      animate: animate);
  }

  /// Create one series with sample hard coded data.
  List<charts.Series<Metrica, String>> _createSeriesData(List<Metrica> dados) {
    return [
      new charts.Series<Metrica, String>(
        id: 'Metricas',
        labelAccessorFn: (Metrica metrica, __) => metrica.valor.toString(),
        colorFn: (_, __) => colorBar != null? colorBar : charts.MaterialPalette.green.shadeDefault.lighter,
        domainFn: (Metrica metrica, _) => metrica.periodo,
        measureFn: (Metrica metrica, _) => metrica.valor,
        data: dados != null? dados : [],
      )
    ];
  }
}