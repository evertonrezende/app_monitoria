import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/utils/navigator.dart';
import 'package:flutter/material.dart';

class CardDisciplina extends StatelessWidget {
  final Disciplina _disciplina;

  CardDisciplina(this._disciplina);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          pushPage(context, '/home/disciplina/materias',
              paramenters: _disciplina);
        },
        child: Container(
          decoration: BoxDecoration(
            color: ColorTheme.secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          child: _getContent(_disciplina.favorita),
        ));
  }

  // Conteúdo para card tipo favorito
  Column _getContent(bool favorita) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topRight,
          child: Icon(
            favorita? Icons.star : Icons.star_border,
            size: 18,
            color: Colors.yellowAccent,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(bottom: 8, left: 5, right: 5),
          child: Text(
            _disciplina.nome,
            textAlign: TextAlign.left,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
