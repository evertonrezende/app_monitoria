import 'package:app_distribuida2/widgets/drawer_list.dart';
import 'package:app_distribuida2/widgets/app_lista_disciplina.dart';
import 'package:app_distribuida2/widgets/app_card_materia.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Dashboard"),
        centerTitle: true,
        actions: <Widget>[
          //IconButton(icon: Icon(Icons.more_vert), onPressed: (){}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {})
        ],
      ),
      drawer: DrawerList(
          // color: Colors.yellow,

          ),
      body: _body(),
    );
  }

  _body() {
    
            //return Container(

               return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AppDisciplina(),
                    ],
              );



                //color: Colors.lightBlue[100],
                //child: AppDisciplina(),
                //child: AppCardMaterias(),
                //child: Text('It’s either that or meet the business end of a bayonet'),
           // );
  
    
  } // fim do método _body

  


  

}
