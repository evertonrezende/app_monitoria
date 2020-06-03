import 'package:app_distribuida2/models/duvida.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/widgets/searchBox.widget.dart';
import 'package:flutter/material.dart';
import './duvidas.module.dart' as Module;

class DuvidasPage extends StatefulWidget {
  @override
  _Duvidas createState() => _Duvidas();
}

class _Duvidas extends State<DuvidasPage> {
  List<Duvida> _duvidas = <Duvida>[];
  List<Duvida> _duvidasFiltered = <Duvida>[];

  @override
  void initState() {
    super.initState();
    Module.getDuvidas(context).then((result) => {
      setState(() {
        _duvidas = _duvidasFiltered = result;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorTheme.backgroundNeutroColor,
      child: Column(
        mainAxisSize: MainAxisSize.max, 
        children: <Widget>[
          _searchBox(), 
          Expanded(
            child: ListView.builder(
            itemCount: _duvidasFiltered.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildCardDuvida(_duvidasFiltered[index], index + 1 == _duvidasFiltered.length);                      
            })
          )
      ]));
  }

  _buildCardDuvida(Duvida duvida, bool last_card) {
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: last_card? 50 : 5, left: 10, right: 10),
          color: ColorTheme.secondaryColor,
          child: Row(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(duvida.resposta == null? Icons.watch_later : Icons.check)
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(duvida.assunto, style: TextStyle(fontWeight: FontWeight.w500)),
                  Text(
                      "Disciplina: XXX | Matéria: XXX", 
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)
                  ),
                  Divider(),
                  Text(
                      "Aguardando Resposta", 
                      style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300)
                  )
                ])
            )
          ]),
        )
      );
  }

  // Retorna um campo de busca
  Widget _searchBox() {
    return SearchBox(() {
      setState(() {
        _duvidasFiltered = _duvidas;
      });
    }, (String value) {
      List<Duvida> result = _filterDuvidas(value);
      setState(() {
        _duvidasFiltered = result;
      });
    }, "Procure sua dúvida...");
  }

  // Realiza uma busca sobre a lista de dúvidas
  List<Duvida> _filterDuvidas(String value) {
    List<Duvida> filterList = new List<Duvida>();
    _duvidas.forEach((p) {
      var contains = p.assunto.toLowerCase().contains(value.toLowerCase());
      if (contains) filterList.add(p);
    });
    return filterList;
  }
}
