import 'dart:convert';

import 'package:todo_challenge_2/src/core/database_helper.dart';

class TaskModel {
  final int? id;
  final String title;
  final String description;
  final bool isCompleted;

  TaskModel(
      {this.id,
      required this.title,
      required this.description,
      required this.isCompleted});

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, isCompleted: $isCompleted)';
  }

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnDescription: description,
      DatabaseHelper.columnIsCompleted: isCompleted ? 1 : 0,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map[DatabaseHelper.columnId] as int,
      title: map[DatabaseHelper.columnTitle] as String,
      description: map[DatabaseHelper.columnDescription] as String,
      isCompleted: map[DatabaseHelper.columnIsCompleted] == 1 ? true : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        isCompleted.hashCode;
  }
}
