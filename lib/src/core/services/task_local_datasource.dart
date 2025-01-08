import 'package:sqflite/sqflite.dart';
import 'package:todo_challenge_2/src/core/result.dart';

import '../../core/exceptions/database_exception.dart';
import '../../domain/models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<Result<LocalDatabaseException, List<TaskModel>>> getTasks();
  Future<Result<LocalDatabaseException, int>> addTask(TaskModel task);
  Future<Result<LocalDatabaseException, int>> updateTask(TaskModel task);
  Future<Result<LocalDatabaseException, void>> deleteTask(int id);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Database database;

  TaskLocalDataSourceImpl(this.database);

  @override
  Future<Result<LocalDatabaseException, List<TaskModel>>> getTasks() async {
    try {
      final List<Map<String, dynamic>> maps = await database.query('tasks');
      return Success(maps.map((map) => TaskModel.fromMap(map)).toList());
    } catch (e) {
      return Failure(LocalDatabaseException('Error fetching tasks'));
    }
  }

  @override
  Future<Result<LocalDatabaseException, int>> addTask(TaskModel task) async {
    try {
      return Success(await database.insert('tasks', task.toMap()));
    } catch (e) {
      return Failure(LocalDatabaseException('Error adding task'));
    }
  }

  @override
  Future<Result<LocalDatabaseException, int>> updateTask(TaskModel task) async {
    try {
      return Success(await database.update(
        'tasks',
        task.toMap(),
        where: 'id = ?',
        whereArgs: [task.id],
      ));
    } catch (e) {
      return Failure(LocalDatabaseException('Error updating task'));
    }
  }

  @override
  Future<Result<LocalDatabaseException, int>> deleteTask(int id) async {
    try {
      return Success(await database.delete(
        'tasks',
        where: 'id = ?',
        whereArgs: [id],
      ));
    } catch (e) {
      return Failure(LocalDatabaseException('Error deleting task'));
    }
  }
}
