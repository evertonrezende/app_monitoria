import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final String _title;
  final String _description;

  ItemList(this._title, this._description);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            new Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topLeft,
                child: Icon(Icons.person, size: 50.0, color: Colors.black12)),
            new Expanded(child: _details(_title)),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }

  // Dados do item da lista
  _details(_title) {
    return ListTile(
        title: Text(
          _title,
          style: TextStyle(color: ColorTheme.primaryColor),
        ),
        subtitle: 
          Text(_description)
        );
  }
}
