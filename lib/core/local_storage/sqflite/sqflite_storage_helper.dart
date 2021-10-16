import 'dart:async';

import 'package:flutter_case_project/core/local_storage/sqflite/ISqfliteStorageHelper.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';

class SqfliteStorageHelper extends ISqfliteStorageHelper {
  SqfliteStorageHelper(String dbName, DatabaseConfigure onConfiguring)
      : super(dbName, onConfiguring);

  @override
  Future<void> initDb() async {
    if (db == null) {
      db = await createDB();
    }
  }

  @override
  Future<Database> createDB() async {
    String path = join(await getDatabasesPath(), "$dbName.db");
    Database database =
        await openDatabase(path, version: 1, onCreate: onConfiguring);
    return database;
  }
}

typedef DatabaseConfigure = FutureOr<void> Function(Database db, int version);
