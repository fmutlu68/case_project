import 'dart:async';

import 'package:flutter_case_project/core/local_storage/IStorageHelper.dart';
import 'package:flutter_case_project/core/local_storage/sqflite/sqflite_storage_helper.dart';
import 'package:sqflite/sqflite.dart';

abstract class ISqfliteStorageHelper extends IStorageHelper {
  final String dbName;
  final DatabaseConfigure onConfiguring;
  Database? db;

  ISqfliteStorageHelper(this.dbName, this.onConfiguring);

  Future<Database> createDB();
}
