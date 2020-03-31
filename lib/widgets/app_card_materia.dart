import 'package:flutter/material.dart';
import 'package:app_distribuida2/utils/nav.dart';
import 'package:app_distribuida2/pages/materias_page.dart';

class AppCardMaterias extends StatelessWidget {
  TextEditingController textFieldController = TextEditingController();
  String materia = 'AED';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.lightBlue[50],
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            childAspectRatio: 2, //(itemWidth / itemHeight),
            //color: Colors.lightBlue[50],
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print("Container clicked");

                  materia = 'AED';
                  _sendDataToSecondScreen(context, materia);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0XFF06CEC0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: new Text(
                    'AED',
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
                    borderRadius: BorderRadius.circular(10)),
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
                    borderRadius: BorderRadius.circular(10)),
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
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(8),
                child: new Text(
                  "IHC",
                  style: new TextStyle(
                    color: Colors.black,
                  ),
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 50.0,
        hoverColor: Colors.red,
        icon: Icon(Icons.person),
        label: Text('Monitor'),
        onPressed: () {
          print('clicou no botão');
        },
        backgroundColor: Color(0XFF06CEC0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: new BottomAppBar(
        color: Colors.white,
      ),
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print("Chamou pagina >> $s");
  }

  void _sendDataToSecondScreen(BuildContext context, String materia) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MateriasPage(
            text: materia,
          ),
        ));
  }
}
