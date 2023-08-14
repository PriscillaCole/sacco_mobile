import 'package:sqflite/sqflite.dart';
import 'package:sacco/models/user.dart';

class DatabaseHelper {
  static late Database _database;

  static Future<void> initialize() async {
    _database = await openDatabase(
      'user_database.db',
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY,
            name TEXT,
            username TEXT,
            email TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser(User user) async {
    await _database.insert('users', user.toJson());
  }

  Future<List<User>> getUsers() async {
    final List<Map<String, dynamic>> maps = await _database.query('users');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        username: maps[i]['username'],
        email: maps[i]['email'],
      );
    });
  }

  Future<void> updateUser(User user) async {
    await _database.update(
      'users',
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<void> deleteUser(int id) async {
    await _database.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
