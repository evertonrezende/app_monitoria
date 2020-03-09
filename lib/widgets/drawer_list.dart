
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
           Divider(),
           ListTile(
            leading: Icon(Icons.help),
            title: Text("MINHAS DÚVIDAS",),
            onTap: () {
              print("Item2");
              Navigator.pop(context);
            },

          ),
           ListTile(
            leading: Icon(Icons.people),
            title: Text("MONITORES",),
            onTap: () {
              print("Item3");
              Navigator.pop(context);
            },

          ),
          Divider(),
            ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("SAIR",),
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