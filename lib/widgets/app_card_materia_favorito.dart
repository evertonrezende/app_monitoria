import 'package:flutter/material.dart';
import 'package:app_distribuida2/pages/materias_page.dart';

class AppCardMateriasFavorito extends StatelessWidget {
  TextEditingController textFieldController = TextEditingController();
  String materia = 'AED';

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 2, //(itemWidth / itemHeight),

      //color: Colors.lightBlue[50],
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              //color: Colors.lightBlue[200],
              color: Color(0XFF06CEC0),
              borderRadius: BorderRadius.circular(10)),
          //padding: const EdgeInsets.all(5),
          padding: const EdgeInsets.only(
              top: 2, right: 2), //Container da disciplina favoritas
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  //padding: const EdgeInsets.only(bottom:1),
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print("Container clicked");
                    //_onClickNavigator(context);
                    materia = 'AED';
                    _sendDataToSecondScreen(context, materia);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.only(bottom: 8, left: 5, right: 5),
                    alignment: Alignment.center,
                    child: Text(
                      'AED',
                      maxLines: 2, //limita o texto em duas linhas
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
            //child: const Text("AED"),
          ),
          // alignment: Alignment.center,
        ),
        Container(
          decoration: BoxDecoration(
              // color: Colors.lightBlue[200],
              color: Color(0XFF06CEC0),
              borderRadius: BorderRadius.circular(10)),

          padding: const EdgeInsets.only(
              top: 2, right: 2), //Container da disciplina favoritas
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(bottom: 8, left: 5, right: 5),
                  child: Text(
                    'Aplicações Distribuídas',
                    maxLines: 2, //limita o texto em duas linhas
                    overflow: TextOverflow
                        .ellipsis, //coloca os 3 pontinhos se caso ultrapassar a quantidade de caractes das 2 linhas
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _sendDataToSecondScreen(BuildContext context, String materia) {
    //String textToSend = textFieldController.text;

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MateriasPage(
            text: materia,
          ),
        ));
  }
}
