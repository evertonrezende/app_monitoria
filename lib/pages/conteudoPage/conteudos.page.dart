import 'package:app_distribuida2/models/conteudo.model.dart';
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
    return FutureBuilder(
        future: Module.getConteudos(
          context,
        ),
        builder: (context, AsyncSnapshot<List<Conteudo>> snapshot) {
          List<Widget> conteudosCard = new List<Widget>();
          if (snapshot.hasData) {
            snapshot.data.forEach(
                (c) => conteudosCard.add(_topicoItem(context, c.id, c.nome)));
          }

          return Scaffold(
              appBar: AppBar(                
                title: Text(_materia.nome, style: Theme.of(context).textTheme.headline6),
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
                  children: conteudosCard,
                ),
              ));
        });
  }

  // ItemList de tópicos (conteúdo) da matéria
  Widget _topicoItem(context, id, nome) {
    return Center(
      child: Card(
        color: Colors.greenAccent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.school,
                  size: 25.0,
                ),
                title: Text("${_materia.nome}"),
                subtitle: Text("\nId do Conteúdo: $id " + "\nDescrição do conteudo: $nome"),
                onTap: () {
                  alertConfirm(context, "Deseja abrir o tópico \"$id'\"?", () {
                    popPage(context);
                  }, Icons.class_);
                }),
            ButtonBar(
              children: <Widget>[
                FittedBox(
                  child: FloatingActionButton.extended(
                    heroTag: null, 
                    elevation: 10.0,
                    backgroundColor: ColorTheme.secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    icon: Icon(Icons.favorite, size: 15.0),
                    splashColor: Colors.greenAccent,
                    hoverColor: Colors.greenAccent,
                    label: Text(
                      'Útil',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    onPressed: () {
                      print('Clicou em útil');
                    },
                  ),
                ),
                FittedBox(
                  child: FloatingActionButton.extended(
                    heroTag: null,
                    elevation: 10.0,
                    backgroundColor: ColorTheme.secondaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    icon: Icon(Icons.favorite_border, size: 15.0),
                    splashColor: Colors.redAccent,
                    hoverColor: Colors.redAccent,
                    label: Text(
                      'Não Útil',
                      style: TextStyle(fontSize: 12.0),
                    ),
                    onPressed: () {
                      print('Clicou em não útil');
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  // Retorna um popup com opções da aplicação
  Widget _popUp(context) {
    return PopupMenuButton<String>(
      onSelected: (choice) {
        if (choice == Opcoes.perguntas) {
          pushPage(context, '/home/disciplina/materias/perguntas-frequentes');
        }
        else if (choice == Opcoes.duvidas) {
          print("Clicou em duvidas");
          // pushPage(context, '/home/disciplina/materias/duvidas');
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
