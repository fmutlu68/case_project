import 'package:flutter_case_project/models/users/user.dart';
import 'package:sqflite/sqflite.dart';

abstract class IUserService {
  final List<User>? users;
  final Database localStorage;
  IUserService(this.localStorage, {this.users});

  Future<void> addUser(User user);
  Future<void> deleteUser(User user);
  Future<void> loadUsersToLocalStorage();
  Future<List<User>> getUsers();
}
