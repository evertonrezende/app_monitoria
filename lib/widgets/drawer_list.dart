import 'package:flutter/material.dart';
import 'package:app_distribuida2/utils/nav.dart';
import 'package:app_distribuida2/pages/login_page.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        _createOption("Olá Fulano", () {Navigator.pop(context);}),
        Divider(),
        _createOption("MINHAS DÚVIDAS", () {Navigator.pop(context);}, Icon(Icons.help)),
        _createOption("MONITORES", () {Navigator.pop(context);}, Icon(Icons.people)),
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
    Navigator.pop(context);
    push(context, LoginPage());
  }
}
