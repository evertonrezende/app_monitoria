import 'package:flutter/material.dart';

class MonitoresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0XFF009086),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.star_border),
              color: Colors.yellowAccent,
              onPressed: () {}),
        ],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Monitores"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      color: const Color(0XFFCEFFE4),
      child: ListView(
        children: _getMaterias(context),
      ),
    );
  }

  // Obtem a lista de materias de uma disciplina
  // Lista todas as disciplinas marcadas como favoritas
  List<Widget> _getMaterias(context) {
    const nomes = ['Algoritmos de Ordenação', 'Lista', 'Fila', 'Recursividade', 'Árvores Binárias'];
    var materias = new List<Widget>();

    nomes.forEach((nome) => {
          materias.add(
          ListTile(
              leading: Icon(Icons.description),
              title: Text(nome),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print("OK");
              })
          )
    });

    return materias;
  }

}
