import 'package:app_distribuida2/models/duvida.model.dart';
import 'package:app_distribuida2/widgets/colapsedItem.widget.dart';
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
      color: Colors.lightBlue[50],
      padding: EdgeInsets.all(10.0),
      child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        _searchBox(), 
        Expanded(
            child: ListView.builder(
          itemCount: _duvidasFiltered.length,
          itemBuilder: (BuildContext context, int index) {
            return ColapsedItem(_duvidasFiltered[index].assunto,
                _duvidasFiltered[index].resposta != null? _duvidasFiltered[index].resposta : "");                      
          },                
        )),
      ]));
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
