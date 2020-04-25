import 'package:app_distribuida2/utils/appStorage.dart';
import 'package:app_distribuida2/widgets/cardDisciplina.widget.dart';
import 'package:app_distribuida2/widgets/drawerList.widget.dart';
import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/models/usuario.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/widgets/searchBox.widget.dart';
import 'package:flutter/material.dart';
import './home.module.dart' as Module;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Disciplina> _disciplinas = new List<Disciplina>();
  List<Disciplina> _disciplinasFiltered = new List<Disciplina>();
  List<Disciplina> _disciplinasFavoritas = new List<Disciplina>();
  bool _isLoadDisciplinasFavoritas = true;
  bool _isLoadDisciplinas = true;
  Usuario _userData;

  @override
  void initState() {
    super.initState();

    AppStorage.getCurrentUser().then((user) {
      setState(() {
        _userData = user;
      });
    });

    Module.getDisciplinas(context).then((disciplinas) {
      setState(() {
        _isLoadDisciplinas = false;
        _disciplinas = _disciplinasFiltered = disciplinas;
      });
    });

    Module.getDisciplinas(context, true).then((disciplinasFavoritas) {
      setState(() {
        _isLoadDisciplinasFavoritas = false;
        _disciplinasFavoritas = disciplinasFavoritas;
      });
    });
  }

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
              unselectedLabelColor: ColorTheme
                  .textUnselectedColor, //Cor do texto TabBar sem seleção
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
        drawer: DrawerList(_userData),
        body: TabBarView(children: [_bodyFavoritos(context), _body(context)]),
        floatingActionButton: _userData != null
            ? (_userData.isMonitor ? _isMonitorFlag() : null)
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: new BottomAppBar(
          color: Colors.white,
        ),
      ),
    );
  }

  // Retorna um campo de busca
  Widget _searchBox() {
    return Container(
        decoration: BoxDecoration(
          color: ColorTheme.backgroundNeutroColor,
        ),
        child: SearchBox(() {
          setState(() {
            _disciplinasFiltered = _disciplinas;
          });
        }, (String value) {
          List<Disciplina> result = _filterDisciplinas(value);
          setState(() {
            _disciplinasFiltered = result;
          });
        }, "Procure uma disciplina..."),
    );
  }

  // Realiza uma busca sobre a lista de perguntas
  List<Disciplina> _filterDisciplinas(String value) {
    List<Disciplina> filterList = new List<Disciplina>();
    _disciplinas.forEach((p) {
      var contains = p.nome.toLowerCase().contains(value.toLowerCase());
      if (contains) filterList.add(p);
    });
    return filterList;
  }

  // Loading
  _buildWaitingWidget() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorTheme.backgroundNeutroColor,
      ),
      child: CircularProgressIndicator(),
    );
  }

  // Cards de disciplinas
  _body(context) {
    return _isLoadDisciplinas
        ? _buildWaitingWidget()
        : Column(
            children: <Widget>[
              _searchBox(),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: ColorTheme.backgroundNeutroColor,
                      ),
                      child: GridView.builder(
                        primary: false,
                        padding: const EdgeInsets.all(10),
                        itemCount: _disciplinasFiltered.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return CardDisciplina(_disciplinasFiltered[index], false);
                        },
                      )))
            ],
          );
  }

  // Cards de disciplinas favoritas
  _bodyFavoritos(context) {
    return _isLoadDisciplinasFavoritas
        ? _buildWaitingWidget()
        : Container(
            child: Container(
                decoration: BoxDecoration(
                  color: ColorTheme.backgroundNeutroColor,
                ),
                child: GridView.builder(
                  primary: false,
                  padding: const EdgeInsets.all(10),
                  itemCount: _disciplinasFavoritas.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CardDisciplina(_disciplinasFavoritas[index], true);
                  },
                )));
  }

  // Flag que descreve que o aluno é um monitor
  _isMonitorFlag() {
    return FloatingActionButton.extended(
      elevation: 50.0,
      hoverColor: Colors.red,
      icon: Icon(Icons.person),
      label: Text('Monitor'),
      onPressed: () {
        print('clicou no botão');
      },
      backgroundColor: ColorTheme.secondaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
    );
  }
}
