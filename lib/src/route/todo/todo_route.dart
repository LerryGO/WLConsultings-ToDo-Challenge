import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_challenge_2/src/core/services/task_local_datasource.dart';
import 'package:todo_challenge_2/src/ui/todo/todo_page.dart';

import '../../ui/task/view_models/task_viewmodel.dart';

class TodoRoute {
  TodoRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<TaskLocalDataSource>(
            create: (context) =>
                TaskLocalDataSourceImpl(context.read<Database>()),
          ),
          ChangeNotifierProvider(
            create: (context) => TaskViewmodel(
              taskLocalDataSource: context.read<TaskLocalDataSource>(),
            ),
          ),
        ],
        child: const TodoPage(),
      );
}
