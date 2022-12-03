import 'package:flutter/material.dart';
import 'package:todo_app_challange/models/task_model.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.taskModel.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "this task added at ${widget.taskModel.createdAt.toString().substring(0, 10).replaceAll('-', '/')} at the time ${widget.taskModel.createdAt.toString().substring(10, 16)}",
              style: const TextStyle(fontSize: 16),
            ),
            Icon(widget.taskModel.isDone ? Icons.check : Icons.cancel_outlined,
                color: widget.taskModel.isDone ? Colors.green : Colors.red,
                size: size.width * 0.5)
          ],
        ),
      ),
    );
  }
}
