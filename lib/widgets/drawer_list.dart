import 'package:app_distribuida2/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:app_distribuida2/pages/login_page.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        ListTile(
          title: Text(
            "Olá Fulano",
          ),
          onTap: () {
            print("Item1");
            Navigator.pop(context);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.help),
          title: Text(
            "MINHAS DÚVIDAS",
          ),
          onTap: () {
            print("Item2");
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text(
            "MONITORES",
          ),
          onTap: () {
            print("Item3");
            Navigator.pop(context);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text(
            "SAIR",
          ),
          onTap: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Icon(
                        Icons.exit_to_app,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  content: new Text('Sair?'),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          push(context, LoginPage());
                        },
                        child: new Text("Sim")),
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("Não"))
                  ],
                ));
          },
        ),
      ],
    ));
  }
}
