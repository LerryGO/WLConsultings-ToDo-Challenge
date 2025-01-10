import 'package:flutter/material.dart';
import 'package:todo_challenge_2/src/core/result.dart';
import 'package:todo_challenge_2/src/core/services/task_local_datasource.dart';
import 'package:todo_challenge_2/src/domain/models/task_model.dart';

class TaskViewmodel extends ChangeNotifier {
  final TaskLocalDataSource _taskLocalDataSource;

  TaskViewmodel({required TaskLocalDataSource taskLocalDataSource})
      : _taskLocalDataSource = taskLocalDataSource;

  final List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;

  Future<Result<Exception, List<TaskModel>>> getTasks() async {
    final result = await _taskLocalDataSource.getTasks();
    return result.when(
      success: (tasks) {
        _tasks.clear();
        _tasks.addAll(tasks);
        notifyListeners();
        return Success(tasks);
      },
      failure: (exception) => Failure(exception),
    );
  }

  Future<Result<Exception, TaskModel>> addTask(TaskModel task) async {
    final result = await _taskLocalDataSource.addTask(task);
    return result.when(
      success: (id) {
        _tasks.add(task);
        notifyListeners();
        return Success(task);
      },
      failure: (exception) => Failure(exception),
    );
  }

  Future<Result<Exception, TaskModel>> updateTask(TaskModel task) async {
    final result = await _taskLocalDataSource.updateTask(task);
    return result.when(
      success: (_) {
        final index = _tasks.indexWhere((element) => element.id == task.id);
        _tasks[index] = task;
        notifyListeners();
        return Success(task);
      },
      failure: (exception) => Failure(exception),
    );
  }

  Future<Result<Exception, TaskModel>> deleteTask(TaskModel task) async {
    if (task.id == null) {
      return Failure(Exception("Task id is null"));
    }
    final result = await _taskLocalDataSource.deleteTask(task.id!);
    return result.when(
      success: (_) {
        _tasks.removeWhere((element) => element.id == task.id);
        notifyListeners();
        return Success(task);
      },
      failure: (exception) => Failure(exception),
    );
  }
}
