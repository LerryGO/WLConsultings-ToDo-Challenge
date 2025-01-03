// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String _databaseName = 'task_app.db';
  static const int _databaseVersion = 1;

  static const String taskTable = 'tasks';
  static const String columnId = 'id';
  static const String columnCloudId = 'cloud_id';
  static const String columnTitle = 'title';
  static const String columnIsCompleted = 'is_completed';

  Future<Database?> initializeDatabase() async {
    final String path = join(await getDatabasesPath(), _databaseName);
    return openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $taskTable (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnCloudId INTEGER,
        $columnTitle TEXT NOT NULL,
        $columnIsCompleted INTEGER NOT NULL
      )
    ''');
  }
}
