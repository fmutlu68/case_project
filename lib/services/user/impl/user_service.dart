import 'package:flutter_case_project/models/users/user.dart';
import 'package:flutter_case_project/services/user/IUserService.dart';
import 'package:sqflite/sqflite.dart';

class UserService extends IUserService {
  UserService(Database localStorage, {List<User>? users})
      : super(localStorage, users: users);

  @override
  Future<void> addUser(User user) async {
    await localStorage.insert('users', user.toJson);
  }

  @override
  Future<void> loadUsersToLocalStorage() async {
    if (users != null) {
      for (User item in users!) {
        await addUser(item);
      }
    }
  }

  @override
  Future<void> deleteUser(User user) async {
    await localStorage.rawDelete('delete from users where id=${user.id}');
  }

  @override
  Future<List<User>> getUsers() async {
    List<Map<String, Object?>> users = await localStorage.query("users");
    return users.map((e) => User.fromJson(e)).toList();
  }
}
