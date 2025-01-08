import 'package:flutter/material.dart';
import 'package:todo_challenge_2/src/ui/task/component/task_list.dart';
import 'package:todo_challenge_2/src/ui/task/component/welcome_header.dart';
import 'package:todo_challenge_2/src/ui/task/view_models/task_viewmodel.dart';

class TaskListTab extends StatefulWidget {
  final TaskViewmodel _taskViewmodel;

  const TaskListTab({super.key, required TaskViewmodel taskViewmodel})
      : _taskViewmodel = taskViewmodel;

  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  @override
  void initState() {
    widget._taskViewmodel.getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: ListenableBuilder(
        listenable: widget._taskViewmodel,
        builder: (context, _) {
          final tasks = widget._taskViewmodel.tasks;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              WelcomeHeader(
                  name: "John",
                  message: tasks.isNotEmpty
                      ? "You've got ${tasks.length} tasks to do "
                      : "Create tasks to achieve more"),
              Expanded(
                child: Visibility(
                  visible: tasks.isNotEmpty,
                  replacement: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        Image.asset(
                          "assets/files.png",
                          width: 120,
                          height: 120,
                        ),
                        Text(
                          "Create your first task",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xffe6f3ff),
                            foregroundColor: Color(0xff007fff),
                            iconColor: Color(0xff007fff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          label: Text("Create Task"),
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                  child: TaskList(todoList: tasks),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
