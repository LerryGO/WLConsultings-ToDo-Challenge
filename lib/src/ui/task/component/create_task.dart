import 'package:flutter/material.dart';
import 'package:todo_challenge_2/src/domain/models/task_model.dart';

import '../view_models/task_viewmodel.dart';

class CreateTask extends StatefulWidget {
  final TaskViewmodel _taskViewmodel;
  const CreateTask({
    super.key,
    required TaskViewmodel taskViewmodel,
  }) : _taskViewmodel = taskViewmodel;

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskNoteController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isChecked = false;
  @override
  void dispose() {
    super.dispose();
    _taskTitleController.dispose();
    _taskNoteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16)
          .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    activeColor: Colors.green,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _taskTitleController,
                      validator: (value) => value!.isEmpty ? 'Required' : null,
                      decoration: InputDecoration(
                        hintText: "What's in your mind?",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.edit),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _taskNoteController,
                      decoration: InputDecoration(
                        hintText: 'Add a note',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final task = TaskModel(
                        title: _taskTitleController.text,
                        description: _taskNoteController.text,
                        isCompleted: isChecked,
                      );
                      await widget._taskViewmodel.addTask(task);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    }
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.blue),
                  child: Text(
                    'Create',
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
