import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:flutter/material.dart';

class ColapsedList<T> extends StatelessWidget {
  final String _titulo;
  final List<Widget> _lista;

  const ColapsedList(this._titulo, this._lista);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(3.0),
      color: ColorTheme.secondaryColor,
      child: ExpansionTile(
        key: PageStorageKey<Key>(key),
        title: Text(
          _titulo,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        ),
        children: _lista,
      ),
    );
  }
}
