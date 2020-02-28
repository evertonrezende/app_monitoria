import 'package:flutter/material.dart';

class AppCardMaterias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  
      return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        
        //color: Colors.lightBlue[50],
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(8),
            child: const Text("AED"),
            alignment: Alignment.center,
            
          ),
          Container(
             decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(8),
            child: const Text("Calculo 2"),
            alignment: Alignment.center,
           
          ),
          Container(
             decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(8),
            child: const Text("Aplicações Distribuídas"),
            alignment: Alignment.center,

          ),
          Container(
             decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(8),
            child: const Text("Calculo 2"),
            alignment: Alignment.center,

          ),
          Container(
             decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(8),
            child: const Text("Banco de dados"),
            alignment: Alignment.center,
            
          ),
          Container(
             decoration: BoxDecoration(
              color: Colors.lightBlue[200],
              borderRadius: BorderRadius.circular(10)
            ),
            padding: const EdgeInsets.all(8),
            child: const Text("Inteligência artificial"),
            alignment: Alignment.center,
            
          ),
        ],
      );
  }

    
  }

