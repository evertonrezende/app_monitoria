import 'package:flutter/material.dart';
import 'package:app_distribuida2/utils/nav.dart';
import 'package:app_distribuida2/pages/materias_page.dart';

class AppCardMateriasFavorito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 2,
      children: _getDisciplinasFavorias(context),
    );
  }

  // Lista todas as disciplinas marcadas como favoritas
  List<Widget> _getDisciplinasFavorias(context) {
    const nomes = ['AED', 'Inteligência Artificial'];
    var disciplinas = new List<Widget>();

    nomes.forEach((nome) => {
          disciplinas.add(GestureDetector(
            onTap: () {
              push(context, MateriasPage(nome));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0XFF06CEC0),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.only(top: 2, right: 2),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.star,
                        color: Colors.yellowAccent,
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(bottom: 8, left: 5, right: 5),
                      alignment: Alignment.center,
                      child: Text(
                        nome,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ))
        });

    return disciplinas;
  }
}
