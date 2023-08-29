// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sacco/models/sacco_member.dart';

class DatabaseHelper {
  static late Database _database;

  Future<void> initialize() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'sacco_member_database.db'),
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE sacco_members(
            id INTEGER PRIMARY KEY,
            sacco_id INTEGER,
            user_id INTEGER,
            full_name TEXT,
            date_of_birth TEXT,
            gender TEXT,
            image TEXT,
            nationality TEXT,
            identification_number INTEGER,
            physical_address TEXT,
            postal_address TEXT,
            email TEXT,
            phone_number INTEGER,
            employment_status TEXT,
            employer_name TEXT,
            monthly_income INTEGER,
            bank_account_number INTEGER,
            bank_name TEXT,
            membership_type TEXT,
            membership_id TEXT,
            date_of_joining TEXT,
            next_of_kin_name TEXT,
            next_of_kin_contact INTEGER,
            beneficiary_name TEXT,
            beneficiary_relationship TEXT,
            status TEXT,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertSaccoMember(SaccoMember saccoMember) async {
    print('Inserting sacco member');
    await _database.insert('sacco_members', saccoMember.toJson());
    print('Sacco member inserted successfully');
  }

  Future<List<SaccoMember>> getSaccoMembers() async {
    final List<Map<String, dynamic>> maps =
        await _database.query('sacco_members');

    return List.generate(maps.length, (i) {
      return SaccoMember.fromJson(maps[i]);
    });
  }

  Future<void> updateSaccoMember(SaccoMember saccoMember) async {
    await _database.update(
      'sacco_members',
      saccoMember.toJson(),
      where: 'id = ?',
      whereArgs: [saccoMember.id],
    );
  }

  Future<void> deleteSaccoMember(int id) async {
    await _database.delete(
      'sacco_members',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<bool> checkUserExists(int userId) async {
    final db = await _database; // Ensure _database is initialized

    final count = Sqflite.firstIntValue(await db.rawQuery(
      'SELECT COUNT(*) FROM sacco_members WHERE user_id = ?',
      [userId],
    ));

    return count! > 0;
  }

  Future<void> getAllSaccoMembers() async {
    print('Fetching all Sacco members');
    final db = await _database; // Ensure _database is initialized

    final List<Map<String, dynamic>> members = await db.query('sacco_members');

    if (members.isNotEmpty) {
      for (final member in members) {
        print(member);
        //print('User ID: ${member['user_id']}, Email: ${member['email']}');
      }
    } else {
      print('No Sacco members found.');
    }
  }

  Future<void> deleteAllSaccoMembers() async {
    print('Deleting all Sacco members');
    final db = await _database; // Ensure _database is initialized

    await db.delete('sacco_members');

    print('All Sacco members deleted.');
  }
}
