import 'package:sqflite/sqflite.dart';

import '../../core/exceptions/database_exception.dart';
import '../../domain/models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskModel>> getTasks();
  Future<void> addTask(TaskModel task);
  Future<void> updateTask(TaskModel task);
  Future<void> deleteTask(int id);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Database database;

  TaskLocalDataSourceImpl(this.database);

  @override
  Future<List<TaskModel>> getTasks() async {
    try {
      final List<Map<String, dynamic>> maps = await database.query('tasks');
      return maps.map((map) => TaskModel.fromMap(map)).toList();
    } catch (e) {
      throw LocalDatabaseException('Error fetching tasks');
    }
  }

  @override
  Future<void> addTask(TaskModel task) async {
    try {
      await database.insert('tasks', task.toMap());
    } catch (e) {
      throw LocalDatabaseException('Error adding task');
    }
  }

  @override
  Future<void> updateTask(TaskModel task) async {
    try {
      await database.update(
        'tasks',
        task.toMap(),
        where: 'id = ?',
        whereArgs: [task.id],
      );
    } catch (e) {
      throw LocalDatabaseException('Error updating task');
    }
  }

  @override
  Future<void> deleteTask(int id) async {
    try {
      await database.delete(
        'tasks',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw LocalDatabaseException('Error deleting task');
    }
  }
}
