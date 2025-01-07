import 'package:flutter/material.dart';
import 'package:todo_challenge_2/src/domain/models/task_model.dart';

import 'component/welcome_header.dart';

class CreateTaskTab extends StatelessWidget {
  const CreateTaskTab({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = <TaskModel>[];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WelcomeHeader(name: "John", message: "Create tasks to achieve more"),
          Expanded(
            child: Visibility(
              visible: tasks.isEmpty,
              child: Center(
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
            ),
          ),
        ],
      ),
    );
  }
}
