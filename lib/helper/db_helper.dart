import 'dart:io';

import 'package:bank_app/data/dummy_data.dart';
import 'package:bank_app/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  final _userData = DummyData().userdata;

  Future<Database> get dataBase async => _db ??= await initDB();

  initDB() async {
    Directory documentsDirectory = await getApplicationSupportDirectory();
    String path = join(documentsDirectory.path, 'BankDB.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db
          .execute(
              'CREATE TABLE User (name TEXT PRIMARY KEY, email TEXT, balance DOUBLE)')
          .then((_) async {
        _userData.forEach((user) async {
          await db.insert('User', {
            'name': user.userName,
            'email': user.email,
            'balance': user.balance,
          });
        });
      });
    });
  }

  Future<void> updateDatabse(User sender, User receiver) async {
    final db = await dataBase;
    await db.update('User', {'balance': receiver.balance},
        where: 'name = ?', whereArgs: [receiver.userName]);
    await db.update('User', {'balance': sender.balance},
        where: 'name = ?', whereArgs: [sender.userName]);
  }
}
