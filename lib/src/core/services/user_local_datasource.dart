import 'package:sqflite/sqflite.dart';
import 'package:todo_challenge_2/src/core/exceptions/database_exception.dart';

import '../../domain/models/user_model.dart';

abstract class UserLocalDatasource {
  Future<UserModel> getUser();
  Future<void> addUser(UserModel user);
  Future<void> updateUser(UserModel user);
  Future<void> deleteUser(int id);
}

class UserLocalDatasourceImpl implements UserLocalDatasource {
  final Database database;

  UserLocalDatasourceImpl(this.database);
  @override
  Future<void> addUser(UserModel user) {
    try {
      return database.insert('users', user.toMap());
    } catch (e) {
      throw LocalDatabaseException('Error adding user');
    }
  }

  @override
  Future<void> deleteUser(int id) {
    try {
      return database.delete(
        'users',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw LocalDatabaseException('Error deleting user');
    }
  }

  @override
  Future<UserModel> getUser() async {
    try {
      final List<Map<String, dynamic>> maps = await database.query('users');
      return UserModel.fromMap(maps.first);
    } catch (e) {
      throw LocalDatabaseException('Error fetching user');
    }
  }

  @override
  Future<void> updateUser(UserModel user) {
    try {
      return database.update(
        'users',
        user.toMap(),
        where: 'id = ?',
        whereArgs: [user.id],
      );
    } catch (e) {
      throw LocalDatabaseException('Error updating user');
    }
  }
}
