import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:flutter/material.dart';
import './metricas.module.dart' as Module;

class MetricasPage extends StatelessWidget {
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
      )
    );
  }
}
