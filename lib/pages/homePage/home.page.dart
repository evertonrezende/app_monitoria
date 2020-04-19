import 'package:app_distribuida2/widgets/cardDisciplina.widget.dart';
import 'package:app_distribuida2/widgets/drawerList.widget.dart';
import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/models/usuario.dart';
import 'package:flutter/material.dart';
import './home.module.dart';

class HomePage extends StatelessWidget {
  final Usuario _userData;

  HomePage(this._userData);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.white), //cor do menu
          backgroundColor: ColorTheme.primaryColor,
          bottom: TabBar(
              unselectedLabelColor:
                  ColorTheme.textUnselectedColor, //Cor do texto TabBar sem seleção
              labelColor: Colors.white, //Cor do texto TabBar com seleção
              indicatorColor: Colors.white, // Cor da tab selecionada
              labelStyle: TextStyle(
                color: Colors.white,
              ),
              tabs: [
                Tab(text: "FAVORITOS"),
                Tab(text: "DISCIPLINAS"),
              ]),
        ),
        drawer: DrawerList(this._userData.nome),
        body: TabBarView(children: [_bodyFavoritos(context), _body(context)]),
      ),
    );
  }

  // Páginas das disciplinas
  _body(context) {
    return FutureBuilder<List<Disciplina>>(
        future: getDisciplinas(context),
        builder: (context, AsyncSnapshot<List<Disciplina>> snapshot) {
          var disciplinasData = new List<Widget>();
          if (snapshot.hasData) 
            snapshot.data.forEach((d) => disciplinasData.add(CardDisciplina(d, false)));

          return Container(
              child: Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.backgroundNeutroColor,
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
    return FutureBuilder<List<Disciplina>>(
        future: getDisciplinas(context, true),
        builder: (context, AsyncSnapshot<List<Disciplina>> snapshot) {
          var disciplinasData = new List<Widget>();
          if (snapshot.hasData) 
            snapshot.data.forEach((d) =>  disciplinasData.add(CardDisciplina(d, true)));

          return Container(
              child: Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.backgroundNeutroColor,
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
}
