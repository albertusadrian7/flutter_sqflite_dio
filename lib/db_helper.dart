import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'contact.dart';

class DbHelperSqflite {
  static Future<Database> initDb() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'contacts.db');
    return await openDatabase(path, version: 1, onCreate: createDb);
  }

  // Build create database function
  static Future createDb(Database db, int version) async {
    const sql = '''CREATE TABLE contacts
    (id INTEGER PRIMARY KEY,
    name TEXT, 
    email TEXT)
    ''';

    await db.execute(sql);
  }

  // Build insert function
  static Future<int> insertContact(Contact contact) async {
    Database db = await DbHelperSqflite.initDb();
    return await db.insert('contacts', contact.toJson());
  }

  // Build read function
  static Future<List<Contact>> readContacts() async {
    Database db = await DbHelperSqflite.initDb();
    var contact = await db.query('contacts', orderBy: 'name');
    List<Contact> contactList = contact.isNotEmpty
        ? contact.map((details) => Contact.fromJson(details)).toList()
        : [];
    return contactList;
  }

  // Build update function
  static Future<int> updateContact(Contact contact) async {
    Database db = await DbHelperSqflite.initDb();
    return await db.update('contacts', contact.toJson(),
        where: 'id = ?', whereArgs: [contact.id]);
  }

  // Build delete function
  static Future<int> deleteContact(int id) async {
    Database db = await DbHelperSqflite.initDb();
    return await db.delete('contacts',where: 'id = ?', whereArgs: [id]);
  }
}
