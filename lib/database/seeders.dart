import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/models/usuario.model.dart';
import 'package:sqflite/sqflite.dart';

class Seeders {  
  static Future createUsuarios(Database db) async {    
      await db.execute(
          'CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, login VARCHAR, nome VARCHAR, senha VARCHAR, token VARCHAR, isMonitor INTEGER)');
      var user1 = new Usuario("monitor", "Monitor", "123", "", true);
      var user2 = new Usuario("aluno", "Aluno", "123", "", false);
      await db.insert('usuarios', user1.toJson());
      await db.insert('usuarios', user2.toJson());      
  }
  
  static Future createDisciplinas(Database db) async {    
      await db.execute(
          'CREATE TABLE disciplinas (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, favorita INTEGER)');      
      var d1 = new Disciplina("Algoritmo e Estrutura de Dados", true);
      var d2 = new Disciplina("Programação Orientada a Objetos", false);
      var d3 = new Disciplina("Cálculo I", true);
      var d4 = new Disciplina("Sistemas Operacionais", true);
      var d5 = new Disciplina("Grafos", true);
      var d6 = new Disciplina("Algoritmos e Técnicas de Programação", false);
      var d7 = new Disciplina("Técnicas Avançadas de Programação", false);
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
  }
  
  static createTopicos(Database db) async {
      await db.execute(
          'CREATE TABLE topicos (id INTEGER PRIMARY KEY AUTOINCREMENT, assunto VARCHAR, texto TEXT, likes INTEGER, deslikes INTEGER)');
  }
}