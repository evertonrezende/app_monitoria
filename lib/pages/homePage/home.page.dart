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
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  List<Disciplina> _disciplinas = new List<Disciplina>();
  List<Disciplina> _disciplinasFiltered = new List<Disciplina>();
  bool _isLoadDisciplinas = true;
  Usuario _userData;

  final double _headerLength = 150;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _drawerKey,
        drawer: DrawerList(_userData),
        body: new Stack(
        children: <Widget>[
            Container(height: _headerLength, 
              child: _buildTitle()
            ),
            _buildTopHeader(context),
            _body(context)
          ],
        ),
      );
  }

  // Retorna o cabeçalho
  Widget _buildTopHeader(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.menu, size: 32.0, color: Colors.white), 
            onPressed: (){
               _drawerKey.currentState.openDrawer();
            }
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                _userData.nome,
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),           
          CircleAvatar(
            minRadius: 15.0,
            maxRadius: 15.0,
            backgroundImage: new AssetImage('assets/images/user.png'),
          ),       
         ],
      ),
    );
  }

  // Retorna o título da página
  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: _headerLength / 1.8),
      child: Center(
        child: Text(
          'Disciplinas',
          textAlign: TextAlign.center,
          style: new TextStyle(
              fontSize: 26.0,
              color: Colors.white,
              fontWeight: FontWeight.w300),
        ),)
    );
  }
  
  // Retorna um campo de busca
  Widget _searchAndFilterBox() {
    return Container(
        decoration: BoxDecoration(
          color: ColorTheme.backgroundNeutroColor,
        ),
        child: Row(children: [
          Flexible(child: 
            SearchBox(() {
                setState(() {
                  _disciplinasFiltered = _disciplinas;
                });
              }, (String value) {
                List<Disciplina> result = _filterDisciplinas(value);
                setState(() {
                  _disciplinasFiltered = result;
                });
              }, "Procure uma disciplina...")
          ),
          PopupMenuButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onSelected: (value) {
              List<Disciplina> result = filterDisciplinasByFavorito(value);
              setState(() {
                _disciplinasFiltered = result;
              });
            },
            itemBuilder: (context) {
              return [
                _popupItem(1, Icon(Icons.star, color: Colors.black, size: 18), "Favoritas"),
                _popupItem(0, Icon(Icons.select_all, color: Colors.black, size: 18), "Todas"),
              ];
          },)         
          ]),
    );
  }

  // Item do menu popup
  PopupMenuItem _popupItem(value, Icon icon, String text) {
    return PopupMenuItem(
      value: value,
      child: 
      RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: Padding(padding: EdgeInsets.only(right: 5), child: icon),
              ),
              TextSpan(
                text: text,
                style: TextStyle(color: Colors.black)
              ),
            ],
          ),
        )
    );
  }

  // Loading
  Widget _buildWaitingWidget() {
    return Padding(
      padding: EdgeInsets.only(top: _headerLength),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorTheme.backgroundNeutroColor,
        ),
        child: CircularProgressIndicator(),
      )
    );
  }

  // Cards de disciplinas
  Widget _body(context) {
    return _isLoadDisciplinas
        ? _buildWaitingWidget()
        : Padding(
            padding: EdgeInsets.only(top: _headerLength), child: 
            Column(          
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _searchAndFilterBox(),
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
                            return CardDisciplina(_disciplinasFiltered[index]);
                          },
                        )))
              ],
            )
          );
  }

  //### Consultas
  // Realiza uma busca sobre a lista de perguntas
  List<Disciplina> _filterDisciplinas(String value) {
    List<Disciplina> filterList = new List<Disciplina>();
    _disciplinas.forEach((p) {
      var contains = p.nome.toLowerCase().contains(value.toLowerCase());
      if (contains) filterList.add(p);
    });
    return filterList;
  }

  // Filtra as disciplinas por favorito ou não
  List<Disciplina> filterDisciplinasByFavorito(value) {
    List<Disciplina> filterList = new List<Disciplina>();

    if(value == 1) {      
      _disciplinas.forEach((p) {
        if (p.favorita) filterList.add(p);
      });
    }
    else {         
      _disciplinas.forEach((p) {
        filterList.add(p);
      });
    }
    return filterList;
  }

}
