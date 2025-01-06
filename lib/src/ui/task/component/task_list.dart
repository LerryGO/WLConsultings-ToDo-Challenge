import 'package:flutter/material.dart';

import '../../../domain/models/task_model.dart';
import 'task_item_card.dart';

class TaskList extends StatelessWidget {
  final List<TaskModel> _todoList;
  const TaskList({super.key, required List<TaskModel> todoList})
      : _todoList = todoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _todoList.length,
      itemBuilder: (context, index) {
        final title = _todoList[index].title;
        final description = _todoList[index].description;
        final isCompleted = _todoList[index].isCompleted;
        return TaskItemCard(
          title: title,
          description: description,
          isCompleted: isCompleted,
        );
      },
    );
  }
}
