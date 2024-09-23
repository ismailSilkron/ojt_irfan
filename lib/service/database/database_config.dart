import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ojt_irfan/service/database/database_exception.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {
  Database? _db;

  static const String _dbName = "ojt.db";
  static const int _dbVersion = 2;

  DatabaseConfig._internal();

  static final DatabaseConfig _singleton = DatabaseConfig._internal();

  factory DatabaseConfig() {
    return _singleton;
  }

  Future<Database> getDb() async {
    _db ?? await initDatabase();

    if (_db != null) {
      return _db!;
    }

    throw ErrorDbNotOpen();
  }

  Future<void> initDatabase() async {
    try {
      final String dbPath = join(
        await getDatabasesPath(),
        _dbName,
      );

      _db = await openDatabase(
        dbPath,
        version: _dbVersion,
        onCreate: _createDb,
        onUpgrade: (db, oldVersion, newVersion) async {},
      );
    } on MissingPlatformDirectoryException {
      throw ErrorGetDocumentDirectory();
    } catch (e) {
      Logger().e("Failed to open database :$e");
      throw FailedOpenDatabase(e);
    }
  }

  Future<void> _createDb(Database db, int newVersion) async {
    debugPrint("========= creating tables ========");
  }
}
