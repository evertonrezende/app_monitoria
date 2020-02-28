
import 'package:flutter/material.dart';

class  DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text("Olá Fulano",),
            onTap: () {
              print("Item1");
              Navigator.pop(context);
            },

          ),
           ListTile(
            leading: Icon(Icons.help),
            title: Text("Minhas Dúvidas",),
            onTap: () {
              print("Item2");
              Navigator.pop(context);
            },

          ),
           ListTile(
            leading: Icon(Icons.people),
            title: Text("Monitores",),
            onTap: () {
              print("Item3");
              Navigator.pop(context);
            },

          ),
            ListTile(
            leading: Icon(Icons.close),
            title: Text("Sair",),
            onTap: () {
              print("Item3");
              Navigator.pop(context);
            },

          ),
        ],
      )
    );
  }
}