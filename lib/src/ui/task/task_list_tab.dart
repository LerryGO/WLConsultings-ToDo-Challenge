import 'package:flutter/material.dart';
import 'package:todo_challenge_2/src/ui/task/component/task_list.dart';
import 'package:todo_challenge_2/src/ui/task/component/welcome_header.dart';

import '../../domain/models/task_model.dart';

class TaskListTab extends StatefulWidget {
  const TaskListTab({super.key});

  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  final List<TaskModel> _todoList = [
    TaskModel(
      id: 1,
      title: 'Task 1',
      description:
          'By the time a prospect arrives at upor signup, they are already interested in your product or service. They are in the consideration stage of the buyer’s journey and are looking for more information about your company. They are also interested in learning more about your product or service and how it can help them solve their problem. This is the perfect time to provide them with the information they need to make an informed decision. You can use a variety of content types to educate your prospects and help them understand the value of your product or service. Here are some examples of content you can use to nurture your leads at the bottom of the funnel:',
      isCompleted: false,
    ),
    TaskModel(
      id: 2,
      title: 'Task 2',
      description: 'Description 2',
      isCompleted: false,
    ),
    TaskModel(
      id: 3,
      title: 'Task 3',
      description: 'Description 3',
      isCompleted: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16,
        children: [
          WelcomeHeader(
              name: "John",
              message: _todoList.isNotEmpty
                  ? "You've got 3 tasks to do "
                  : "Create tasks to achieve more"),
          Expanded(
            child: Visibility(
              visible: _todoList.isNotEmpty,
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
              child: TaskList(todoList: _todoList),
            ),
          )
        ],
      ),
    );
  }
}
