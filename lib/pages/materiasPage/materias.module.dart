import 'package:flutter/material.dart';

  // Obtem a lista de materias de uma disciplina
List<Widget> getMaterias(context, idDisciplina) {
    const nomes = ['Algoritmos de Ordenação', 'Lista', 'Fila', 'Recursividade', 'Árvores Binárias'];
    var materias = new List<Widget>();

    nomes.forEach((nome) => {
          materias.add(
          ListTile(
              leading: Icon(Icons.description),
              title: Text(nome),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                print("OK");
              })
          )
    });

    return materias;
  }