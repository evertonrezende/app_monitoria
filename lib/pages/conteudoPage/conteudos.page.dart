import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/utils/alertConfirm.dart';
import 'package:app_distribuida2/utils/navigator.dart';
import 'package:flutter/material.dart';
import './conteudos.module.dart' as Module;

class ConteudosPage extends StatelessWidget {
  final Materia _materia;

  ConteudosPage(this._materia);

  @override
  Widget build(BuildContext context) {
    var listaConteudos = Module.getConteudos(context, _materia.id);
    List<Widget> itensConteudo = new List<Widget>();
    listaConteudos
        .forEach((c) => itensConteudo.add(_topicoItem(context, c.nome)));

    return Scaffold(
        appBar: AppBar(
          title: Text(_materia.nome),
          centerTitle: true,
          backgroundColor: ColorTheme.primaryColor,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => popPage(context),
          ),
          actions: <Widget>[_popUp(context)],
        ),
        body: Container(
          color: Colors.lightBlue[50],
          child: ListView(
            children: itensConteudo,
          ),
        ));
  }

  // ItemList de tópicos (conteúdo) da matéria
  Widget _topicoItem(context, nome) {
    return Card(
        color: Colors.greenAccent,
        child: ListTile(
          leading: Icon(
            Icons.school,
            size: 25.0,
          ),
          title: Text("${_materia.nome} : $nome"),
          subtitle: Text('Descrição do conteudo'),
          onTap: () { alertConfirm(context, "Deseja abrir o tópico \"$nome'\"?", () { popPage(context); }, Icons.class_); }
        ));
  }

  // Retorna um popup com opções da aplicação
  Widget _popUp(context) {
    return PopupMenuButton<String>(
      onSelected: (choice) {
        if (choice == Opcoes.perguntas) {
          pushPage(context, '/home/disciplina/materias/perguntas-frequentes');
        }
      },
      itemBuilder: (BuildContext context) {
        return Opcoes.opcoes.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}

class Opcoes {
  static const String duvidas = 'Ver duvidas';
  static const String perguntas = 'Perguntas Frequentes';

  static const List<String> opcoes = <String>[duvidas, perguntas];
}
