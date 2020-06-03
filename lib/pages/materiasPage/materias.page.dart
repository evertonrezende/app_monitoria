import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/utils/navigator.dart';
import 'package:app_distribuida2/widgets/colapsedList.widget.dart';
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
  bool _isLoading = true;

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
                  Module.setDisciplinaFavorita(context, _disciplina.id, _disciplina.favorita)
                    .catchError((e) => 
                      _disciplina.favorita = !_disciplina.favorita
                    );
                });
              }),
        ],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => popPage(context),
        ),
        title: Text(widget._disciplina.nome, style: Theme.of(context).textTheme.headline6)
      ),
      backgroundColor: ColorTheme.backgroundNeutroColor,
      body: _body(context)
    );
  }
  
  // Loading
  Widget _buildWaitingWidget() {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorTheme.backgroundNeutroColor,
        ),
        child: CircularProgressIndicator(),
      );
  }

  // Lista de matérias
  _body(context) {
    return FutureBuilder(
      future: Module.getMaterias(context, widget._disciplina.id)
                    .whenComplete(() => _isLoading = false),
      builder: (context, AsyncSnapshot<List<Materia>> snapshot) {
        List<Widget> materiasCard = new List<Widget>();
        if (snapshot.hasData)
          snapshot.data
              .forEach((m) => materiasCard.add(_buildColapsedList(context, m)));
          
        return _isLoading? _buildWaitingWidget() :
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[  
                  FlatButton(
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      pushPage(context, '/home/disciplina/materias/perguntas-frequentes');
                    },
                    child: Text(
                      "Perguntas Frequentes ...",
                      style: TextStyle(
                        color: ColorTheme.primaryColor,
                        decoration: TextDecoration.underline
                      )
                    ),
                  ),    
                  Expanded(child: ListView(
                    children: materiasCard,
                  ))
                ]
              );
      },
    );
  }

  // Colapsed item com tópicos da matéria
  _buildColapsedList(context, Materia materia) {
    return ColapsedList(
      materia.nome, 
      materia.conteudos != null?
        materia.conteudos.map((c) => 
            Column(children: <Widget>[         
              Divider(color: Colors.black),     
              ListTile(
                leading: Icon(Icons.description),
                subtitle: Text(c.texto.length > 35? c.texto.substring(0,35) + "..." : c.texto),
                title: Text(
                  c.assunto,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300
                  ),
                ),
                onTap: () {
                  pushPage(context, '/home/disciplina/materias/conteudo/',
                      paramenters: c);
              }),
            ])
          ).toList()
        : [],
    );
  }
}
