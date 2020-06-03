import 'package:app_distribuida2/database/seeders.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class DbHelper {
  static Database _database;
  static DbHelper _dbHelper;

  DbHelper._createInstance();

  factory DbHelper() {

       if (_dbHelper == null) {
         // executado somente uma vez
        _dbHelper = DbHelper._createInstance();
      }
      return _dbHelper;
   }

  Future<Database> get database async {
    // _database = null; // TEMP
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
  }

  static Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'monitoria.db';

    // await deleteDatabase(path); // TEMP
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await Seeders.createUsuarios(db);
          await Seeders.createDisciplinas(db);
          await Seeders.createMaterias(db);
          await Seeders.createConteudos(db);
          await Seeders.createDuvidas(db);
        }
    );
  }

  Future close() async {
    Database db = await this.database;
    await db.close(); 
  }
}