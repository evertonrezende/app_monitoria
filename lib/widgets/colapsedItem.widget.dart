import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColapsedItem extends StatelessWidget {
  final String _titulo;
  final String _texto;

  const ColapsedItem(this._titulo, this._texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(3.0),
      color: Colors.greenAccent,
      child: ExpansionTile(
        key: PageStorageKey<Key>(key),
        title: Text(
          _titulo,
          style: TextStyle(color: Colors.black87),
        ),
        children: [_content()],
      ),
    );
  }

  // Dados do collapsed
  _content() {
    return Container(
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(3.0),
      child: Text(_texto),
    );
  }
}
