import 'package:app_distribuida2/models/usuario.model.dart';
import 'package:app_distribuida2/utils/alertConfirm.dart';
import 'package:app_distribuida2/utils/appStorage.dart';
import 'package:flutter/material.dart';
import 'package:app_distribuida2/utils/navigator.dart';

class DrawerList extends StatelessWidget {
  final Usuario _usuario;

  DrawerList(this._usuario);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        _createOption("Olá ${_usuario?.nome}", () {
          popPage(context);
        }),
        Divider(),
        _createOption("MINHAS DÚVIDAS", () {
          popPage(context);
        }, Icon(Icons.help)),
        _createOption("MONITORES", () {
          pushPage(context, '/home/monitores');
        }, Icon(Icons.people)),
        _usuario != null? (_usuario.isMonitor? _createOption("MÉTRICAS", () {
          pushPage(context, '/home/metricas');
        }, Icon(Icons.multiline_chart)) : null) : null,
        Divider(),
        _createOption("SAIR", () {
          _onClickLogout(context);
        }, Icon(Icons.exit_to_app))
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
    alertConfirm(context, "Sair?", () {
      AppStorage.clearStorage();
      popPage(context);
      pushPage(context, '/');
    }, Icons.exit_to_app);
  }
}
