import 'package:app_distribuida2/widgets/chartBar.widget.dart';
import 'package:app_distribuida2/models/metrica.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import './metricas.module.dart' as Module;

class MetricasPage extends StatefulWidget {
  @override
  _MetricasPageState createState() => _MetricasPageState();
}

class _MetricasPageState extends State<MetricasPage> {
  List<Metrica> _indiceDuvidasResolvidas;
  List<Metrica> _indiceDuvidasNaoResolvidas;
  List<Metrica> _indiceMateriasComMaisDuvidas;

  @override
  void initState() {
    super.initState();

    Module.getDuvidasResolvidas(context).then((result) {
      setState(() {
        _indiceDuvidasResolvidas = result;
      });
    });
    Module.getDuvidasNaoResolvidas(context).then((result) {
      setState(() {
        _indiceDuvidasNaoResolvidas = result;
      });
    });
    Module.getDuvidasNaoResolvidas(context).then((result) {
      setState(() {
        _indiceMateriasComMaisDuvidas = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorTheme.primaryColor,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Métricas"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    DateTime data = new DateTime.now();

    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
        decoration: BoxDecoration(
          color: ColorTheme.backgroundNeutroColor,
        ),
        child: Column(
          children: <Widget>[
            _getText(Module.getMonthSync(data.month),
                fontSize: 17,
                topSize: 0,
                bottomSize: 0,
                fontColor: ColorTheme.primaryColor),
            _getText("Índice de Dúvidas Resolvidas (Semanal)"),
            _getRowChart(_indiceDuvidasResolvidas),
            Divider(),
            _getText("Índice de Dúvidas Não Resolvidas (Semanal)"),
            _getRowChart(_indiceDuvidasNaoResolvidas,
                colorBar: charts.MaterialPalette.red.shadeDefault.lighter),
            Divider(),
            _getText("Matérias Com Mais Dúvidas (Semanal)"),
            _getRowChart(_indiceMateriasComMaisDuvidas,
                colorBar: charts.MaterialPalette.purple.shadeDefault.lighter)
          ],
        ));
  }

  Widget _getText(String text,
      {double topSize = 10,
      double bottomSize = 5,
      double fontSize = 14,
      Color fontColor = Colors.black}) {
    return Padding(
        padding: EdgeInsets.only(bottom: bottomSize, top: topSize),
        child: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: fontColor,
                fontSize: fontSize)));
  }

  Widget _getRowChart(List<Metrica> lista, {charts.Color colorBar}) {
    return Expanded(
        child: Row(children: [
      Expanded(
          child: ChartBar(
            lista,
            colorBar: colorBar
          ))
    ]));
  }
}