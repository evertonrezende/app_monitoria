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
      childAspectRatio: 2,
      children:  _getDisciplinas(context),
    );
  }

  // Lista todas as disciplinas
  List<Widget> _getDisciplinas(context) {
    const nomes = ['AED', 'Cálculo II', 'Inteligência Artificial', 'IHC'];
    var disciplinas = new List<Widget>();

    nomes.forEach((nome) => {
      disciplinas.add(
        GestureDetector(
          onTap: () {
            push(context, MateriasPage(nome));
          },
          child: 
          Container(
            decoration: BoxDecoration(
              color: Color(0XFF06CEC0),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(8),
            child: new Text(
              nome,
              style: new TextStyle(
                color: Colors.black,
              ),
            ),
            alignment: Alignment.center,
          ),
        ))
    });

    return disciplinas;
  }

}
