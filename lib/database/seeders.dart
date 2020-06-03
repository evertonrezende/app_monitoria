import 'package:app_distribuida2/models/conteudo.model.dart';
import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/models/duvida.model.dart';
import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/models/usuario.model.dart';
import 'package:sqflite/sqflite.dart';

class Seeders {  
  // Cria e popula a tabela de usuários
  static Future createUsuarios(Database db) async {    
      await db.execute(
          'CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, login VARCHAR, nome VARCHAR, senha VARCHAR, token VARCHAR, isMonitor INTEGER)');
      var user1 = new Usuario("monitor", "Monitor", "123", "", true, id: 1);
      var user2 = new Usuario("aluno", "Aluno", "123", "", false, id: 2);
      await db.insert('usuarios', user1.toJson());
      await db.insert('usuarios', user2.toJson());      
  }
  
  // Cria e popula a tabela de disciplinas
  static Future createDisciplinas(Database db) async {    
      await db.execute(
          'CREATE TABLE disciplinas (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, favorita INTEGER)');      
      var d1 = new Disciplina("Algoritmo e Estrutura de Dados", true, id: 1);
      var d2 = new Disciplina("Programação Orientada a Objetos", false, id: 2);
      var d3 = new Disciplina("Cálculo I", true, id: 3);
      var d4 = new Disciplina("Sistemas Operacionais", true, id: 4);
      var d5 = new Disciplina("Grafos", true, id: 5);
      var d6 = new Disciplina("Algoritmos e Técnicas de Programação", false, id: 6);
      var d7 = new Disciplina("Técnicas Avançadas de Programação", false, id: 7);
      await db.insert('disciplinas', d1.toJson());
      await db.insert('disciplinas', d2.toJson()); 
      await db.insert('disciplinas', d3.toJson()); 
      await db.insert('disciplinas', d4.toJson()); 
      await db.insert('disciplinas', d5.toJson()); 
      await db.insert('disciplinas', d6.toJson()); 
      await db.insert('disciplinas', d7.toJson()); 
  }

  // Cria e popula a tabela de matérias
  static createMaterias(Database db) async {
      await db.execute(
          'CREATE TABLE materias (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, id_disciplina INTEGER)');    
      var m1 = new Materia("Lista", 1, id: 1);
      var m2 = new Materia("Pilha", 1, id: 2);
      var m3 = new Materia("Fila", 1, id: 3);
      await db.insert('materias', m1.toJson());
      await db.insert('materias', m2.toJson());
      await db.insert('materias', m3.toJson());

      
      var m4 = new Materia("Polimorfismo", 2, id: 4);
      var m5 = new Materia("Herança", 2, id: 5);
      await db.insert('materias', m4.toJson());
      await db.insert('materias', m5.toJson());

      
      var m6 = new Materia("Limite", 3, id: 6);
      var m7 = new Materia("Derivada", 3, id: 7);
      await db.insert('materias', m6.toJson());
      await db.insert('materias', m7.toJson());

      
      var m8 = new Materia("Algoritmos de Escalonamento", 4, id: 8);
      var m9 = new Materia("Tratamento de Concorrência", 4, id: 9);
      await db.insert('materias', m8.toJson());
      await db.insert('materias', m9.toJson());

      
      var m10 = new Materia("Circuito Euleriano", 5, id: 10);
      var m11 = new Materia("Circuito Hamiltoniano", 5, id: 11);
      var m12 = new Materia("Busca em Profundidade", 5, id: 12);
      await db.insert('materias', m10.toJson());
      await db.insert('materias', m11.toJson());
      await db.insert('materias', m12.toJson());
      
      
      var m13 = new Materia("Condicionais", 6, id: 13);
      var m14 = new Materia("Matriz", 6, id: 14);
      var m15 = new Materia("Loops", 6, id: 15);
      await db.insert('materias', m13.toJson());
      await db.insert('materias', m14.toJson());
      await db.insert('materias', m15.toJson());

      
      var m16 = new Materia("Closures", 7, id: 16);
      var m17 = new Materia("LinQ", 7, id: 17);
      await db.insert('materias', m16.toJson());
      await db.insert('materias', m17.toJson());
  }
  
  // Cria e popula a tabela de tópicos
  static createConteudos(Database db) async {    
      await db.execute(
          'CREATE TABLE conteudos (id INTEGER PRIMARY KEY AUTOINCREMENT, assunto VARCHAR, texto TEXT, id_materia INTEGER, likes INTEGER, deslikes INTEGER)');             
      var c1 = new Conteudo(1, "Exemplo Prático: Lista de Contatos", _getLoremIpsumText(), 2, 0);
      var c2 = new Conteudo(1, "Trabalhando com Lista Duplamente Encadeada", _getLoremIpsumText(), 15, 0);
      await db.insert('conteudos', c1.toJson());
      await db.insert('conteudos', c2.toJson());

      var c3 = new Conteudo(2, "Como Inverter uma Pilha", _getLoremIpsumText(), 12, 2);
      var c4 = new Conteudo(2, "Por Que o Conceito de Ponteiros é Importante em Pilha", _getLoremIpsumText(), 1, 0);
      await db.insert('conteudos', c3.toJson());
      await db.insert('conteudos', c4.toJson());

      var c5 = new Conteudo(3, "Exemplo Prático: Fila de Processos", _getLoremIpsumText(), 0, 0);
      await db.insert('conteudos', c5.toJson());

      
      
      var c6 = new Conteudo(4, "Entendendo Polimorfismo", _getLoremIpsumText(), 12, 2);
      var c7 = new Conteudo(4, "Quando Seu Usa Polimorfismo?", _getLoremIpsumText(), 1, 0);
      await db.insert('conteudos', c6.toJson());
      await db.insert('conteudos', c7.toJson());

      var c8 = new Conteudo(5, "Herança Múltipla Com Java", _getLoremIpsumText(), 10, 0);
      await db.insert('conteudos', c8.toJson());


      
      var c9 = new Conteudo(6, "O Que é Indeterminação?", _getLoremIpsumText(), 12, 2);
      var c10 = new Conteudo(6, "O Que é o Infinito?", _getLoremIpsumText(), 1, 0);
      await db.insert('conteudos', c9.toJson());
      await db.insert('conteudos', c10.toJson());

      var c11 = new Conteudo(7, "Como Usar Derivada no Geogebra?", _getLoremIpsumText(), 10, 0);
      var c12 = new Conteudo(7, "Exemplo Prático: Derivada em um Software", _getLoremIpsumText(), 10, 0);
      await db.insert('conteudos', c11.toJson());
      await db.insert('conteudos', c12.toJson());
      

      
      var c13 = new Conteudo(8, "Round Robin Explicado", _getLoremIpsumText(), 12, 2);
      var c14 = new Conteudo(8, "Exemplo Prático: Shortest Job First (SJF)", _getLoremIpsumText(), 1, 0);
      await db.insert('conteudos', c13.toJson());
      await db.insert('conteudos', c14.toJson());

      var c15 = new Conteudo(9, "Usando \"Semáforos\" em C#", _getLoremIpsumText(), 10, 0);
      await db.insert('conteudos', c15.toJson());

      

      var c16 = new Conteudo(8, "O Que é Circuito Euleriano?", _getLoremIpsumText(), 7, 0);
      await db.insert('conteudos', c16.toJson());

      var c17 = new Conteudo(11, "O Que é Circuito Hamiltoniano?", _getLoremIpsumText(), 6, 0);
      await db.insert('conteudos', c17.toJson());
      
      var c18 = new Conteudo(12, "Exemplo Prático: Busca em Profundidade em Python", _getLoremIpsumText(), 5, 0);
      await db.insert('conteudos', c18.toJson());
            
      
      
      var c19 = new Conteudo(13, "Operador Condicional Ternário", _getLoremIpsumText(), 8, 0);
      await db.insert('conteudos', c19.toJson());

      var c20 = new Conteudo(14, "Exemplo Prático: Multiplicação de Matrizes", _getLoremIpsumText(), 19, 0);
      var c21 = new Conteudo(14, "Entendendo Matrizes", _getLoremIpsumText(), 10, 0);
      await db.insert('conteudos', c20.toJson());
      await db.insert('conteudos', c21.toJson());
      
      var c22 = new Conteudo(15, "Diferença Entre While e Do-While", _getLoremIpsumText(), 1, 0);
      var c23 = new Conteudo(15, "Loop Infinito", _getLoremIpsumText(), 0, 0);
      await db.insert('conteudos', c22.toJson());
      await db.insert('conteudos', c23.toJson());

      
      
      var c24 = new Conteudo(16, "Exemplo Prático: Closures Com C#", _getLoremIpsumText(), 13, 0);
      var c25 = new Conteudo(16, "O Que São Closures?", _getLoremIpsumText(), 30, 1);
      await db.insert('conteudos', c24.toJson());
      await db.insert('conteudos', c25.toJson());

      var c26 = new Conteudo(17, "Exemplo Prático: LinQ para Manipulação de Dados", _getLoremIpsumText(), 20, 0);
      var c27 = new Conteudo(17, "O Que é LinQ?", _getLoremIpsumText(), 10, 1);
      await db.insert('conteudos', c26.toJson());
      await db.insert('conteudos', c27.toJson());
  }
  
  // Cria e popula a tabela de dúvidas
  static createDuvidas(Database db) async {
      await db.execute(
          'CREATE TABLE duvidas (id INTEGER PRIMARY KEY AUTOINCREMENT, id_aluno INTEGER, id_materia INTEGER, assunto TEXT, resposta TEXT, util INTEGER)');
      
      var d1 = new Duvida(1, 1, "O que é uma lista?", _getLoremIpsumText(), null);
      var d2 = new Duvida(1, 7, "Como resolvo uma derivada de função potência?", _getLoremIpsumText(), null);
      var d3 = new Duvida(1, 2, "Por que quando altero meu objeto pilha também altero a cópia dele?", null, null);
      var d4 = new Duvida(2, 2, "Como inverter uma pilha?", null, null);
      await db.insert('duvidas', d1.toJson());
      await db.insert('duvidas', d2.toJson());
      await db.insert('duvidas', d3.toJson());
      await db.insert('duvidas', d4.toJson());
  }  

  // Retorna texto 'lorem ispum dolor sit amet'
  static String _getLoremIpsumText() {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " +
    "Fusce et sollicitudin est. Suspendisse posuere nisl eu condimentum " +
    "lacinia. Nam velit ligula, vulputate scelerisque imperdiet et, euismod " + 
    "ac metus. Donec eget aliquam ligula, sit amet convallis nisi. Aliquam sed " +
    "congue tortor. Aliquam mattis, dolor at sagittis cursus, neque lacus iaculis " + 
    "turpis, id mattis nisl libero eu risus. Maecenas eu rhoncus turpis. Donec faucibus, " +
    "erat vitae pulvinar ullamcorper, leo elit fringilla mi, quis maximus eros urna at sapien. " + 
    "Duis at risus ut quam pulvinar pharetra. Nullam vestibulum sit amet lacus vitae mollis. " +
    "Aliquam sed congue tortor. Aliquam mattis, dolor at sagittis cursus, neque lacus iaculis " +
    "turpis, id mattis nisl libero eu risus. Maecenas eu rhoncus turpis. Donec faucibus, " + 
    "erat vitae pulvinar ullamcorper, leo elit fringilla mi, quis maximus eros urna at " + 
    "sapien. Duis at risus ut quam pulvinar pharetra. Nullam vestibulum sit amet lacus vitae mollis.";
  }

}