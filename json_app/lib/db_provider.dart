import 'dart:io';
import 'package:json_app/dataBase.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'employee_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Employee('
          'id INTEGER PRIMARY KEY,'
          'email TEXT,'
          'firstName TEXT,'
          'lastName TEXT,'
          'avatar TEXT'
          ')');
    });
  }

  // Insert employee on database
  createSQL(FetchData insertData) async {
    final db = await database;
    final res = await db.insert('Employee', insertData.toJson());

    return res;
  }

  Future<List<FetchData>> getAllData() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM EMPLOYEE");

    List<FetchData> list =
        res.isNotEmpty ? res.map((c) => FetchData.fromJson(c)).toList() : [];

    return list;
  }
}
