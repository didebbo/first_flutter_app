import 'dart:ui';
import 'package:first_flutter_app/Models/item.dart';
import 'package:first_flutter_app/Utils/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  static Database? _database;

  static Future<void> _openDB() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), "my_favorite_friends.db"),
      version: 1,
      onCreate: (db, version) => _createTable(db),
    );
    LogManager.info("Open Database: $_database");
  }

  // static Future<void> _closeDB() async {
  //   _database.close();
  //   LogManager.info("Close Database: $_database");
  // }

  static Future<void> _createTable(Database db) async {
    await db.execute(
        'CREATE TABLE items(id TEXT PRIMARY KEY, name TEXT, surname TEXT, avatarColor INTEGER, isFavorite INTEGER)');
    LogManager.info("Create Table at: $db");
  }

  static Future<void> insertItem(Item item) async {
    await _database?.insert('items', item.toMap());
    LogManager.info("Insert item ${item.id} on database ${_database?.path}");
  }

  static Future<void> deleteItem(String id) async {
    await _database?.delete('items', where: 'id = ?', whereArgs: [id]);
    LogManager.info("Delete item $id on database ${_database?.path}");
  }

  static Future<List<Item>> readItems() async {
    if (_database == null) {
      await _openDB();
    }
    final List<Map<String, dynamic>>? maps = await _database?.query('items');
    LogManager.info("Read items $maps on database ${_database?.path}");
    return List.generate(maps?.length ?? 0, (i) {
      return Item(
        id: maps?[i]['id'],
        name: maps?[i]['name'],
        surname: maps?[i]['surname'],
        avatarColor: Color(maps?[i]['avatarColor']),
        isFavorite: maps?[i]['isFavorite'] == 1,
      );
    });
  }
}
