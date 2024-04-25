import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const table = 'employee';

  static const columnId = '_id';
  static const columnName = 'name';
  static const columnAge = 'age';
  static const columnSalary = 'salary';
  static const columnPhoneNumber = 'phoneNumber';
  static const columnAddress = 'address';

  late Database _db;

  Future<void> createDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
  _id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  age TEXT NOT NULL,
  salary TEXT NOT NULL,
  phoneNumber TEXT NOT NULL,
  address TEXT NOT NULL
          )
          ''');
  }

  //Insert
  Future insert(String name, String age, String salary, String phoneNumber,
      String address) async {
    return await _db.insert(table, {
      columnName: name,
      columnAge: age,
      columnSalary: salary,
      columnPhoneNumber: phoneNumber,
      columnAddress: address,
    });
  }

  //READ DATA
  Future<List<Map<String, dynamic>>> read() async {
    return await _db.query(table);
  }

  //Delete Data
  Future delete(int id) async {
    return await _db.delete(table, where: "$columnId = ?", whereArgs: [id]);
  }

  // Edit Data
  Future<int> edit(int id, String name, String age, String salary,
      String phoneNumber, String address) async {
    return await _db.update(
      table,
      {
        columnName: name,
        columnAge: age,
        columnSalary: salary,
        columnPhoneNumber: phoneNumber,
        columnAddress: address,
      },
      where: "$columnId = ?",
      whereArgs: [id],
    );
  }


}
