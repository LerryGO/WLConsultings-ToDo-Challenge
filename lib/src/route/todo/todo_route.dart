import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_challenge_2/src/core/services/task_local_datasource.dart';
import 'package:todo_challenge_2/src/ui/todo/todo_page.dart';

class TodoRoute {
  TodoRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => TaskLocalDataSourceImpl(context.read()),
          ),
        ],
        child: const TodoPage(),
      );
}
