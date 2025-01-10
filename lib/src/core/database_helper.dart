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
  static const String columnDescription = 'description';
  static const String columnIsCompleted = 'is_completed';

  static const String userTable = "users";
  static const String columnUserId = "id";
  static const String columnUserName = "name";
  static const String columnUserEmail = "email";

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
  }

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
        $columnDescription TEXT NOT NULL,
        $columnIsCompleted INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $userTable (
        $columnUserId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnUserName TEXT NOT NULL,
        $columnUserEmail TEXT NOT NULL
      )
    ''');
  }
}
