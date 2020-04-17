import 'package:flutter/material.dart';
import 'package:app_distribuida2/utils/nav.dart';
import 'package:app_distribuida2/pages/materias.page.dart';

class CardDisciplina extends StatelessWidget {
  String _nomeDisciplina;
  bool _favoritas;

  CardDisciplina(String nomeDisciplina, bool favoritas) {
    _nomeDisciplina = nomeDisciplina;
    _favoritas = favoritas;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          push(context, MateriasPage(_nomeDisciplina));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color(0XFF06CEC0),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: _favoritas
              ? const EdgeInsets.only(top: 2, right: 2)
              : const EdgeInsets.all(8),
          child: _favoritas? _getContentFavorito() : _getContent(),
          alignment: Alignment.center,
        ));
  }

  // Conteúdo para cards normais
  Text _getContent() {
    return new Text(
            _nomeDisciplina,
            style: new TextStyle(
              color: Colors.black,
            ),
          );
  }

  // Conteúdo para card tipo favorito
  Column _getContentFavorito() {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topRight,
          child: Icon(
            Icons.star,
            color: Colors.yellowAccent,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 8, left: 5, right: 5),
          alignment: Alignment.center,
          child: Text(
            _nomeDisciplina,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
