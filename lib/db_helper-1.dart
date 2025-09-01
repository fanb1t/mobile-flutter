// lib/db_helper-1.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _db;

  static final String _dbName = 'mydb.db';
  static final String _tableName = 'users';

  static final String columnId = 'id';
  static final String columnName = 'name';
  static final String columnSex = 'sex';
  static final String columnSalary = 'salary';

  static Future<Database> initDb() async {
    if (_db != null) return _db!;

    String path = join(await getDatabasesPath(), _dbName);

    _db = await openDatabase(
      path,
      version: 3,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnSex TEXT NOT NULL,
            $columnSalary REAL NOT NULL
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion == 2 && newVersion == 3) {
          await db.execute('''
            CREATE TABLE $_tableName\_new (
              $columnId INTEGER PRIMARY KEY,
              $columnName TEXT NOT NULL,
              $columnSex TEXT NOT NULL,
              $columnSalary REAL NOT NULL
            )
          ''');

          await db.execute('''
            INSERT INTO $_tableName\_new SELECT id, name, sex, salary FROM $_tableName
          ''');

          await db.execute('DROP TABLE $_tableName');
          await db.execute('ALTER TABLE $_tableName\_new RENAME TO $_tableName');
        }
      },
    );
    return _db!;
  }

  static Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await initDb();
    return await db.insert(_tableName, user);
  }

  static Future<int> updateUser(int id, Map<String, dynamic> user) async {
    final db = await initDb();
    return await db.update(_tableName, user, where: '$columnId = ?', whereArgs: [id]);
  }

  static Future<int> deleteUser(int id) async {
    final db = await initDb();
    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await initDb();
    return await db.query(_tableName);
  }

  static Future<bool> isIdExists(int id) async {
    final db = await initDb();
    final List<Map<String, Object?>> result = await db.query(
      _tableName,
      where: '$columnId = ?',
      whereArgs: [id],
      limit: 1,
    );
    return result.isNotEmpty;
  }
}