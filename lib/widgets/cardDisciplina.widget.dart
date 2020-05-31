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
          padding: _disciplina.favorita
              ? const EdgeInsets.only(top: 2, right: 2)
              : const EdgeInsets.all(8),
          child: _getContent(_disciplina.favorita),
          alignment: Alignment.center,
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
            color: Colors.yellowAccent,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 8, left: 5, right: 5),
          alignment: Alignment.center,
          child: Text(
            _disciplina.nome,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
