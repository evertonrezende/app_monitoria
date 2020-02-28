
import 'package:flutter/material.dart';

class AppDisciplina extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
            leading: Icon(Icons.map),
            title: Text('Disciplina I'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("OK");
            }
            ),
            
        ListTile(
            leading: Icon(Icons.map),
            title: Text('Disciplina II'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("OK");
            }),
        ListTile(
            leading: Icon(Icons.map),
            title: Text('Disciplina III'),
            //Icon(Icons.star_border),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("OK");
            }
            ),
        ListTile(
            leading: Icon(Icons.map),
            title: Text("Disciplina IV"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("OK");
            }
            ),
        ListTile(
            leading: Icon(Icons.map),
            title: Text("Disciplina V"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("OK");
            }
            ),
      ],
    );

    
  }
}
