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
        _createOption("Olá, ${_usuario?.nome}.", () {
          popPage(context);
        }, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300) ),
        Divider(),
        _createOption("MONITORES", () {
          pushPage(context, '/home/monitores');
        }, icon: Icon(Icons.people)),
        if(_usuario != null && _usuario.isMonitor) _createOption("MÉTRICAS", () {
          pushPage(context, '/home/metricas');
        }, icon: Icon(Icons.multiline_chart)),
        Divider(),
        _createOption("SAIR", () {
          _onClickLogout(context);
        }, icon: Icon(Icons.exit_to_app))
      ],
    ));
  }

  // Retorna um item do menu formatado
  ListTile _createOption(text, Function work, {Icon icon, TextStyle style}) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: style,
      ),
      onTap: () {
        work();
      },
    );
  }

  // Desloga o usuário da aplicação
  _onClickLogout(BuildContext context) {
    alertConfirm(context, "Sair?", () {
      AppStorage.clearStorage().then((value) {
        popPage(context);
        pushPageAsRoot(context, '/');
      });
    }, Icons.exit_to_app);
  }
}
