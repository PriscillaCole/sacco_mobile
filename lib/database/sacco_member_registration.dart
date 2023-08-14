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
            sacco_id TEXT,
            user_id TEXT,
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
    await _database.insert('sacco_members', saccoMember.toJson());
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

  Future<bool> checkUserExists(String userId) async {
    print('Checking if user exists');
    final db = await _database; // Ensure _database is initialized

    final count = Sqflite.firstIntValue(await db.rawQuery(
      'SELECT COUNT(*) FROM sacco_members WHERE user_id = ?',
      [userId],
    ));
    print('Count: $count');

    return count! > 0;
  }
}
