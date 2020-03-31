import 'package:app_distribuida2/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:app_distribuida2/pages/conteudos_page.dart';
import 'package:app_distribuida2/widgets/app_card_materia.dart';

class MateriasPage extends StatelessWidget {
  final String text;
  String materia = '';
  MateriasPage({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0XFF009086),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.star_border),
              color: Colors.yellowAccent,
              onPressed: () {}),
        ],
        leading: new IconButton(
          //alterando a cor do botão de Voltar
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(text),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
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
                _sendConteudosPageScreen(context, materia ='Lista');
                //push(context, ConteudosPage2());
              }),
          ListTile(
              leading: Icon(Icons.description),
              title: Text('Pilha'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print("Clicou Pilha");
                materia ='Pilha';
                _sendConteudosPageScreen(context, materia);
              }),
          ListTile(
              leading: Icon(Icons.description),
              title: Text("Materia IV"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print("OK");
                materia ='Materia IV';
                _sendConteudosPageScreen(context, materia);
              }),
          ListTile(
              leading: Icon(Icons.description),
              title: Text("Materia V"),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print("OK");
                materia ='Materia V';
                _sendConteudosPageScreen(context, materia);
              }),
        ],
      ),
    );
  }

  void _sendConteudosPageScreen(BuildContext context, String materia) {
    //String textToSend = textFieldController.text;

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConteudosPage2(
            matName: materia,
          ),
        ));
  }
}
