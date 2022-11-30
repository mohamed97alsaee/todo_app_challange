class TaskModel {
  TaskModel({
    required this.name,
    required this.isDone,
    required this.createdAt,
  });

  String name;
  bool isDone;
  DateTime createdAt;
}
