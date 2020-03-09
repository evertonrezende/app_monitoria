
import 'package:flutter/material.dart';
class  MateriasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

                 centerTitle: true,
                 backgroundColor: Color(0XFF009086),
                 
                 actions: <Widget>[
                    IconButton(icon: Icon(Icons.star_border), color: Colors.yellowAccent, onPressed: () {}),
                 
                  ], 
                 leading: new IconButton(  //alterando a cor do botão de Voltar
                 icon: new Icon(Icons.arrow_back, color: Colors.white),
                 onPressed: () => Navigator.of(context).pop(),
                 
              ), 
        title: Text("AED"),
        
      ),
      body: _body(),

    );
  
  }

  _body(){
    return Container(
     color: const Color(0XFFCEFFE4),
     child: ListView(
      children: <Widget>[
        ListTile(
          
            leading: Icon(Icons.description),
            title: Text('Lista'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("OK");
            }
            ),
            
        ListTile(
            leading: Icon(Icons.description),
            title: Text('Fila'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("OK");
            }),
        ListTile(
            leading: Icon(Icons.description),
            title: Text('Pilha'),
            //Icon(Icons.star_border),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("OK");
            }
            ),
        ListTile(
            leading: Icon(Icons.description),
            title: Text("Materia IV"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("OK");
            }
            ),
        ListTile(
            leading: Icon(Icons.description),
            title: Text("Materia V"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("OK");
            }
            ),
      ],
    ),
    );
  }

}