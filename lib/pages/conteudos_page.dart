//import 'dart:html';

import 'package:app_distribuida2/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_distribuida2/pages/perguntas_frequentes.dart';

class ConteudosPage2 extends StatelessWidget {
  final String matName;

  ConteudosPage2({Key key, this.matName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var listaConteudos = [
      "Conteúdo 1",
      "Conteúdo 2",
      "Conteúdo 3",
      "Conteúdo 4",
      "Conteúdo 5"
    ];

    var listItem;
    Divider();    
    Row(
      children: <Widget>[
        listItem = new ListView.builder(
          itemCount: listaConteudos.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.lightBlue[50],
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      //Divider(),
                      //Text('Duvidas frequentes...')
                    ],
                  ),
                  Card(
                    color: Colors.greenAccent,
                    child: ListTile(
                      leading: Icon(
                        Icons.school,
                        size: 56.0,
                      ),
                      title: new Card(
                        elevation: 10.0,
                        child: new Container(
                          alignment: Alignment.centerLeft,
                          margin: new EdgeInsets.all(
                              20.0), //(top: 15.0, bottom: 15.0),
                          child:
                              new Text(matName + ': ' + listaConteudos[index]),
                        ),
                      ),
                      subtitle: Text('Descrição do conteudo'),
                      onTap: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            child: new CupertinoAlertDialog(
                              title: new Column(
                                children: <Widget>[
                                  new Text(matName),
                                  new Icon(
                                    Icons.class_,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              content: new Text(
                                  'Deseja abrir o ' + listaConteudos[index]),
                              actions: <Widget>[
                                new FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: new Text("Sim")),
                                new FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: new Text("Não"))
                              ],
                            ));
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0XFF009086),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (choice) {
              if (choice == Opcoes.perguntas) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PerguntasFrequentes()));
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
          )
        ],
        leading: new IconButton(
          //alterando a cor do botão de Voltar
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(matName),
      ),
      body: Container(
        color: Colors.lightBlue[50],
        child: listItem,
      )
      //listItem,
    );
  }
}

class Opcoes {
  static const String duvidas = 'Ver duvidas';
  static const String perguntas = 'Perguntas Frequentes';

  static const List<String> opcoes = <String>[duvidas, perguntas];
}
