import 'package:flutter/material.dart';
import 'package:app_distribuida2/utils/nav.dart';
import 'package:app_distribuida2/pages/materias_page.dart';
class AppCardMaterias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
      return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: 2,  //(itemWidth / itemHeight),
        
        //color: Colors.lightBlue[50],
        children: <Widget>[
          GestureDetector(
          onTap: (){
            print("Container clicked");
            //_onClickNavigator(context);
             push(context, MateriasPage());
          },
          //onPressed: () => _onClickNavigator(context),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0XFF06CEC0),
              
              borderRadius: BorderRadius.circular(10),
               
            ),
            
            padding: const EdgeInsets.all(8),
            child: new Text(
              "AED", 
               style: new TextStyle(
              //fontSize: 20.0,
              //fontWeight: FontWeight.w500,
              color: Colors.black,
              ),
            ),
            alignment: Alignment.center,
            
          ),
          ),
          Container(
             decoration: BoxDecoration(
              //color: Colors.lightBlue[200],
              color: Color(0XFF06CEC0),
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(8),
            child: new Text(
              "Calculo 2",
              style: new TextStyle(
              //fontSize: 20.0,
              //fontWeight: FontWeight.w500,
              color: Colors.black,
              ),
              ),
            alignment: Alignment.center,
           
          ),
          Container(
             decoration: BoxDecoration(
              //color: Colors.lightBlue[200],
              color: Color(0XFF06CEC0),
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(8),
            child: new Text(
              "Inteligência Artificial",
              style: new TextStyle(
              //fontSize: 20.0,
              //fontWeight: FontWeight.w500,
              color: Colors.black,
              ),
             ),
            alignment: Alignment.center,
           
          ),
           Container(
             decoration: BoxDecoration(
              //color: Colors.lightBlue[200],
              color: Color(0XFF06CEC0),
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(8),
            child: new Text(
              "IHC",
              style: new TextStyle(
              //fontSize: 20.0,
              //fontWeight: FontWeight.w500,
              color: Colors.black,
              ),
              ),
            alignment: Alignment.center,
           
          ),
          
        ],
      );
  }

  //void _onClickNavigator(BuildContext context, Widget page) async {
    //String s = await push(context, page);
   // print("Chamou pagina >> $s");
  //}
    
  }

