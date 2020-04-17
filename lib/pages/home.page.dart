import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/providers/disciplina.provider.dart';
import 'package:app_distribuida2/utils/alert.dart';
import 'package:app_distribuida2/models/api-response.model.dart';
import 'package:app_distribuida2/widgets/cardDisciplina.widget.dart';
import 'package:app_distribuida2/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.white), //cor do menu
          backgroundColor: Color(0XFF009086),
          bottom: TabBar(
              unselectedLabelColor:
                  Color(0XFF6EFFE4), //Cor do texto TabBar sem seleção
              labelColor:
                  const Color(0XFFFFFFFF), //Cor do texto TabBar com seleção
              indicatorColor: Color(0XFFFFFFFF), // Cor da tab selecionada
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              tabs: [
                Tab(text: "FAVORITOS"),
                Tab(text: "DISCIPLINAS"),
              ]),
        ),
        drawer: DrawerList(),
        body: TabBarView(children: [_bodyFavoritos(context), _body(context)]),
      ),
    );
  }

  // Páginas das disciplinas
  _body(context) {
    return FutureBuilder<List<Widget>>(
        future: _getDisciplinas(context),
        builder: (context, AsyncSnapshot<List<Widget>> snapshot) {
          var disciplinasData = new List<Widget>();
          if (snapshot.hasData) disciplinasData = snapshot.data;

          return Container(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                  ),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    children: disciplinasData,
                  )));
        });
  }

  // Página das disciplinas marcadas como favoritas
  _bodyFavoritos(context) {    
    return FutureBuilder<List<Widget>>(
        future: _getDisciplinas(context, true),
        builder: (context, AsyncSnapshot<List<Widget>> snapshot) {
          var disciplinasData = new List<Widget>();
          if (snapshot.hasData) 
            disciplinasData = snapshot.data;

          return Container(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                  ),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    children: disciplinasData,
                  )));
        });
  }

  // Lista todas as disciplinas
  Future<List<Widget>> _getDisciplinas(context, [favoritas = false]) async {
    //invoca API de login
    ApiResponse<List<Disciplina>> response = await DisciplinaApi.getDisciplinas();
    List<Widget> disciplinas = new List<Widget>();

    if (!response.ok) {
      alert(context, response.msg);
    } else {
      response.result.forEach((m) => {disciplinas.add(CardDisciplina(m.nome, favoritas))});
    }

    return disciplinas;
  }
}
