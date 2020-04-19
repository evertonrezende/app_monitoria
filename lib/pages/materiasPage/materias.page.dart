import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/utils/navigator.dart';
import 'package:flutter/material.dart';
import './materias.module.dart' as Module;

class MateriasPage extends StatelessWidget {
  final Disciplina _disciplina;

  MateriasPage(this._disciplina);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorTheme.primaryColor,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.star_border),
              color: Colors.yellowAccent,
              onPressed: () {}),
        ],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => popPage(context),
        ),
        title: Text(_disciplina.nome),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      color: ColorTheme.backgroundColor,
      child: ListView(
        children: Module.getMaterias(context, _disciplina.id),
      ),
    );
  }
}
