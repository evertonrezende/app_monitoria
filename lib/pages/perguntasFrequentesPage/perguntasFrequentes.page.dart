import 'package:app_distribuida2/models/perguntaFrequente.model.dart';
import 'package:app_distribuida2/widgets/colapsedItem.widget.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/utils/navigator.dart';
import 'package:flutter/material.dart';
import './perguntasFrequentes.module.dart' as Module;

class PerguntasFrequentes extends StatefulWidget {
  @override
  _PerguntasFrequentes createState() => _PerguntasFrequentes();
}

class _PerguntasFrequentes extends State<PerguntasFrequentes> {
  Icon buscaIcon = Icon(Icons.search);
  Widget buscaBarra = Text("Perguntas Frequentes");
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Module.getperguntaFrequentees(context),
        builder: (context, AsyncSnapshot<List<PerguntaFrequente>> snapshot) {
          var pfData = new List<Widget>();
          if (snapshot.hasData)
            snapshot.data.forEach((p) => pfData.add(ColapsedItem(p.titulo, p.resposta)));

          return Scaffold(
              appBar: AppBar(
                backgroundColor: ColorTheme.primaryColor,
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => popPage(context),
                ),
                title:
                    !isSearching ? Text('Perguntas Frequentes') : _searchBox(),
                actions: <Widget>[
                  isSearching
                      ? IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              this.isSearching = false;
                              //filteredCountries = countries;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              this.isSearching = true;
                            });
                          },
                        )
                ],
              ),
              body: Container(
                  color: Colors.lightBlue[50],
                  padding: EdgeInsets.all(10.0),
                  child: ListView(children: pfData)));
        });
  }

  // Retorna um campo que efetua a busca sobre as perguntas
  _searchBox() {
    return TextField(
      onChanged: (value) {
        //_filterCountries(value);
      },
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: "Busca de perguntas...",
          hintStyle: TextStyle(color: Colors.white)),
    );
  }
}
