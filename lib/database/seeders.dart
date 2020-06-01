import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/models/duvida.model.dart';
import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/models/usuario.model.dart';
import 'package:sqflite/sqflite.dart';

class Seeders {  
  static Future createUsuarios(Database db) async {    
      await db.execute(
          'CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, login VARCHAR, nome VARCHAR, senha VARCHAR, token VARCHAR, isMonitor INTEGER)');
      var user1 = new Usuario("monitor", "Monitor", "123", "", true, id: 1);
      var user2 = new Usuario("aluno", "Aluno", "123", "", false, id: 2);
      await db.insert('usuarios', user1.toJson());
      await db.insert('usuarios', user2.toJson());      
  }
  
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
  
  static createTopicos(Database db) async {
      await db.execute(
          'CREATE TABLE topicos (id INTEGER PRIMARY KEY AUTOINCREMENT, assunto VARCHAR, texto TEXT, likes INTEGER, deslikes INTEGER)');
  }
  
  static createDuvidas(Database db) async {
      await db.execute(
          'CREATE TABLE duvidas (id INTEGER PRIMARY KEY AUTOINCREMENT, id_aluno INTEGER, id_materia INTEGER, assunto TEXT, resposta TEXT, util INTEGER)');
      
      var d1 = new Duvida(1, 1, "O que é uma lista?", null, true);
      var d2 = new Duvida(1, 7, "Como resolvo uma derivada de função potência?", null, true);
      var d3 = new Duvida(2, 7, "Por que quando altero meu objeto pilha também altero a cópia dele?", null, true);
      await db.insert('duvidas', d1.toJson());
      await db.insert('duvidas', d2.toJson());
      await db.insert('duvidas', d3.toJson());
  }
}