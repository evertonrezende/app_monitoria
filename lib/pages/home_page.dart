import 'package:app_distribuida2/widgets/drawer_list.dart';
import 'package:app_distribuida2/widgets/app_card_materia_favorito.dart';
import 'package:app_distribuida2/widgets/app_card_materia.dart';
//import 'package:app_distribuida2/utils/nav.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
       
        child: Scaffold(
        appBar: AppBar(
          //title: Text("Dashboard"),
            centerTitle: true,
            
            actions: <Widget>[
            //IconButton(icon: Icon(Icons.notifications), onPressed: () {})
            ],
            iconTheme: new IconThemeData(color: Colors.white), //cor do menu 
            backgroundColor: Color(0XFF009086),
                      
            bottom: TabBar(
            
              unselectedLabelColor: Color(0XFF6EFFE4), //Cor do texto TabBar sem seleção
              labelColor: const Color(0XFFFFFFFF), //Cor do texto TabBar com seleção
              indicatorColor: Color(0XFFFFFFFF), // Cor da tab selecionada
              
              labelStyle: TextStyle(
                color: Colors.white,
                
                //fontWeight: FontWeight.w200,
              ),
              tabs: [
              Tab(
                text: "DISCIPLINAS", 
                
              ),
              Tab(text: "FAVORITOS",),
            ]),
        ),

        drawer: DrawerList(
            // color: Colors.yellow,
                
            ),
        body: TabBarView(
          children: [
          _body(),
          _bodyFavoritos(

          )
        ]),
    ),
    );
  }

  _body() {
               
        return Container (
             
              child: Container(
                
                 decoration: BoxDecoration(
                 color: Color(0XFFCEFFE4),
                 //borderRadius: BorderRadius.circular(10)
                 ),
                 child: AppCardMaterias(),
                                
                 )
 
               );
    
  } // fim do método _body

  _bodyFavoritos() {
      return Container (
             
              child: Container(
                 decoration: BoxDecoration(
                 color: Colors.lightBlue[50],
                 //borderRadius: BorderRadius.circular(10)
                 ),
                 child: AppCardMateriasFavorito(),
                                
                 )
 
               );
  }


}
