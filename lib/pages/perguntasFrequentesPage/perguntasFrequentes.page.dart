import 'package:app_distribuida2/models/perguntaFrequente.model.dart';
import 'package:app_distribuida2/widgets/colapsedItem.widget.dart';
import 'package:app_distribuida2/widgets/searchBox.widget.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/utils/navigator.dart';
import 'package:flutter/material.dart';
import './perguntasFrequentes.module.dart' as Module;

class PerguntasFrequentesPage extends StatefulWidget {
  @override
  _PerguntasFrequentes createState() => _PerguntasFrequentes();
}

class _PerguntasFrequentes extends State<PerguntasFrequentesPage> {
  List<PerguntaFrequente> _perguntas = <PerguntaFrequente>[];
  List<PerguntaFrequente> _perguntasFiltered = <PerguntaFrequente>[];

  @override
  void initState() {
    super.initState();
    Module.getPerguntaFrequentes(context).then((result) => {
      setState(() {
        _perguntas = _perguntasFiltered = result;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ColorTheme.primaryColor,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => popPage(context),
            ),
            title: Text('Perguntas Frequentes')),
        body: Container(
            color: Colors.lightBlue[50],
            padding: EdgeInsets.all(10.0),
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              _searchBox(),
              Expanded(
                  child: ListView.builder(
                itemCount: _perguntasFiltered.length,
                itemBuilder: (BuildContext context, int index) {
                  return ColapsedItem(_perguntasFiltered[index].titulo,
                      _perguntasFiltered[index].resposta);
                },
              )),
            ])));
  }

  // Retorna um campo de busca
  Widget _searchBox() {
    return SearchBox(() {
      setState(() {
        _perguntasFiltered = _perguntas;
      });
    }, (String value) {
      List<PerguntaFrequente> result = _filterPerguntas(value);
      setState(() {
        _perguntasFiltered = result;
      });
    });
  }

  // Realiza uma busca sobre a lista de perguntas
  List<PerguntaFrequente> _filterPerguntas(String value) {
    List<PerguntaFrequente> filterList = new List<PerguntaFrequente>();
    _perguntas.forEach((p) {
      var contains = p.titulo.toLowerCase().contains(value.toLowerCase());
      if (contains) filterList.add(p);
    });
    return filterList;
  }
}
