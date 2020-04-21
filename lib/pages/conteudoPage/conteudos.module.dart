import 'package:app_distribuida2/models/conteudo.model.dart';

// Obtem a lista de conteudos de uma matéria
List<Conteudo> getConteudos(context, idMateria) {
  List<Conteudo> conteudos = new List<Conteudo>();
  conteudos.add(Conteudo.fromJson({'id': 1, 'nome': 'Conteúdo 1', 'descricao': 'Descrição do conteúdo 1'}));
  conteudos.add(Conteudo.fromJson({'id': 2, 'nome': 'Conteúdo 2', 'descricao': 'Descrição do conteúdo 2'}));
  conteudos.add(Conteudo.fromJson({'id': 3, 'nome': 'Conteúdo 3', 'descricao': 'Descrição do conteúdo 3'}));
  conteudos.add(Conteudo.fromJson({'id': 4, 'nome': 'Conteúdo 4', 'descricao': 'Descrição do conteúdo 4'}));
  conteudos.add(Conteudo.fromJson({'id': 5, 'nome': 'Conteúdo 5', 'descricao': 'Descrição do conteúdo 5'}));

  return conteudos;
}