import 'package:flutter/material.dart';
import 'package:todo_app_challange/models/task_model.dart';

import '../screens/task_details_screen.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print(widget.taskModel.name);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    TaskDetailsScreen(taskModel: widget.taskModel))));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.green, width: 0.5),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, offset: Offset(2, 2), blurRadius: 6)
              ]),
          child: ListTile(
            title: Text(
              widget.taskModel.name,
              style: TextStyle(
                  color: widget.taskModel.isDone ? Colors.red : Colors.black,
                  decoration: widget.taskModel.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            subtitle: Text(
              widget.taskModel.createdAt
                  .toString()
                  .substring(0, 10)
                  .replaceAll('-', '/'),
              style: TextStyle(
                  decoration: widget.taskModel.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            trailing: Checkbox(
              value: widget.taskModel.isDone,
              onChanged: (value) {
                setState(() {
                  widget.taskModel.isDone = !widget.taskModel.isDone;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
