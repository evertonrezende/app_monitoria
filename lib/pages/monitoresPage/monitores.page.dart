import 'package:app_distribuida2/models/monitor.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/widgets/itemList.widget.dart';
import 'package:flutter/material.dart';
import './monitores.module.dart' as Module;

class MonitoresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorTheme.primaryColor,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Monitores', style: Theme.of(context).textTheme.headline6)
      ),
      body: _body(context),
    );
  }
  
  _body(context) {
    return FutureBuilder<List<Monitor>>(
        future: Module.getMonitores(context),
        builder: (context, AsyncSnapshot<List<Monitor>> snapshot) {
          var monitoresData = new List<Widget>();
          if (snapshot.hasData) 
            snapshot.data.forEach((m) => monitoresData.add(ItemList(m.nome, "Disciplina X | Disponível de 10:00 as 12:00")));

            return Container(
              color: ColorTheme.backgroundColor,
              child: ListView(
                children: monitoresData
              ),
            );
        }
    );
  }
}
