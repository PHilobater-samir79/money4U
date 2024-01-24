import 'package:finance_app/features/data/Money_Data/money_model.dart';
import 'package:sqflite/sqflite.dart';

class SQFLiteHelper {
  late Database database;
  void initDatabase() async {
    await openDatabase(
      'money.database',
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute('''
          CREATE TABLE Money (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          moneyValue Double,
          dateTime Text
          )
          ''').then((value) => print('create done'));
      },
      onOpen: (db) => print('database is opened'),
    ).then((value) => database = value).catchError((e) {
      print(e.toString());
    });
  }

  Future<List<Map<String, dynamic>>> getDataFromDatabase() async {
    return await database.rawQuery('SELECT * FROM Money');
  }

  Future<int> insertDataToDatabase(MoneyModel moneyModel) async {
    return await database.rawInsert('''
    INSERT INTO Money (title,dateTime,moneyValue)
     VALUES(
     '${moneyModel.title}',
     '${moneyModel.dateTime}',
     '${moneyModel.moneyValue}'
     )
    ''');
  }

  Future<int> updateDataDatabase(id) async {
    return await database.rawUpdate('''
    UPDATE Money SET WHERE id = ?
    ''', [id]);
  }

  Future<int> deleteDataFromDatabase(id) async {
    return await database.rawDelete('''
    DELETE FROM Money WHERE id = ?
    ''', [id]);
  }
}
