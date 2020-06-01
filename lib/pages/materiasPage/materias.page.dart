import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/utils/navigator.dart';
import 'package:flutter/material.dart';
import './materias.module.dart' as Module;

class MateriasPage extends StatefulWidget {
  final Disciplina _disciplina;
  MateriasPage(this._disciplina);

  @override
  _MateriasPageState createState() => _MateriasPageState(_disciplina);
}

class _MateriasPageState extends State<MateriasPage> {
  Disciplina _disciplina;

  _MateriasPageState(this._disciplina);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorTheme.primaryColor,
        actions: <Widget>[
          IconButton(
              icon: Icon(widget._disciplina.favorita? Icons.star : Icons.star_border),
              color: Colors.yellowAccent,
              onPressed: () {
                setState(() {
                  _disciplina.favorita = !_disciplina.favorita;
                });
              }),
        ],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => popPage(context),
        ),
        title: Text(widget._disciplina.nome, style: Theme.of(context).textTheme.headline6)
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return FutureBuilder(
      future: Module.getMaterias(context, widget._disciplina.id),
      builder: (context, AsyncSnapshot<List<Materia>> snapshot) {
        List<Widget> materiasCard = new List<Widget>();
        if (snapshot.hasData)
          snapshot.data
              .forEach((m) => materiasCard.add(_cardMateria(context, m)));

        return Container(
          color: ColorTheme.backgroundNeutroColor,
          child: ListView(
            children: materiasCard,
          ),
        );
      },
    );
  }

  _cardMateria(context, Materia materia) {
    return ListTile(
        leading: Icon(Icons.description),
        title: Text(materia.nome),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          pushPage(context, '/home/disciplina/materias/conteudo',
              paramenters: materia);
        });
  }
}
