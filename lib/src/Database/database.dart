

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io'as io;

import '../model/user.dart';
class DBHelper {
  static Database?_db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return null;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'Todo.db');
    var db = await openDatabase(path, version: 1, onCreate: _createDatabase);
    return db;
  }

  _createDatabase(Database db, int version) async {
    await db.execute(
      "CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT NOT NULL, password TEXT NOT NULL,)",
    );
  }

  Future<DataModel> insert(DataModel dataModel) async {
    var dbClient = await db;
    await dbClient?.insert('user', dataModel.toMap());
    return dataModel;
  }

/*  Future<void> authenticate(DataModel dataModel)async{
   // var dbClient = await db;
    var res = await _db!.rawQuery("select * from user where email = '${dataModel.email}' AND password = '${dataModel.password}' ");
    if(res.isNotEmpty){
      return null;
    }else{
      return ;
    }
  }*/
  Future<Map<String, Object?>?>getSingleData(int id)async {
    var dbClinet = await db;
    List<Map<String, Object?>> result = await dbClinet!.query(
        'user', where: 'id = ?', whereArgs: [id], limit: 1);

    return result.isNotEmpty ? result.first : null;
  }
  }

