// ignore_for_file: file_names

class ListModel {
  int? id;

  final String tasks;

  final bool isDone;

  ListModel({required this.tasks, this.isDone = false, this.id});
  // void toggleDone() {
  //   isDone = !isDone;
  // }
  static ListModel forMap(Map<String, Object?> Map) {
    final id = Map['id'] as int;
    final tasks = Map['tasks'] as String;

    return ListModel(
      tasks: tasks,
      id: id,
    );
  }
}
