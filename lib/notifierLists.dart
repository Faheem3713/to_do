import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todoo/ListModel.dart';

ValueNotifier<List<ListModel>> taskNotifier = ValueNotifier([]);
late Database data;

Future<void> initializeDb() async {
  data = await openDatabase(
    'task.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db
          .execute('CREATE TABLE task (id INTEGER PRIMARY KEY, tasks TEXT)');
    },
  );
}

Future<void> addTask(ListModel value) async {
  final val = await data
      .rawInsert('INSERT INTO task(tasks) VALUES(?)', ['${value.tasks}']);
  taskNotifier.notifyListeners();
  getAllTasks();
}

Future<void> removeTask(id) async {
  await data.rawDelete('DELETE FROM task WHERE tasks = ?', [id]);
  taskNotifier.notifyListeners();
  getAllTasks();
}

Future<void> getAllTasks() async {
  taskNotifier.value.clear();
  final val = await data.rawQuery('SELECT * FROM task');
  val.forEach((element) {
    final tasks = ListModel.forMap(element);
    taskNotifier.value.add(tasks);
  });
  taskNotifier.notifyListeners();
}
