import 'package:flutter/material.dart';
import 'package:app_distribuida2/utils/navigator.dart';

class DrawerList extends StatelessWidget {
  final String _nomeUsuario;

  DrawerList(this._nomeUsuario);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        _createOption("Olá $_nomeUsuario", () {popPage(context);}),
        Divider(),
        _createOption("MINHAS DÚVIDAS", () {popPage(context);}, Icon(Icons.help)),
        _createOption("MONITORES", () {
          pushPage(context, '/home/monitores');
        }, Icon(Icons.people)),
        Divider(),
        _createOption("SAIR", () {_onClickLogout(context);}, Icon(Icons.exit_to_app))
      ],
    ));
  }

  // Retorna um item do menu formatado
  ListTile _createOption(text, Function work, [Icon icon]) {
    return ListTile(
          leading: icon,
          title: Text(
            text,
          ),
          onTap: () {
            work();
          },
        );
  }

  // Desloga o usuário da aplicação
  _onClickLogout(BuildContext context) {
    popPage(context);
    pushPage(context, '/');
  }
}
