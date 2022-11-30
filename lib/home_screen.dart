import 'package:flutter/material.dart';
import 'package:todo_app_challange/task_card.dart';
import 'package:todo_app_challange/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [];
  TextEditingController taskNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO LIST"),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(labelColor: Colors.black, tabs: [
              Tab(
                text: 'WAIT',
                icon: Icon(Icons.history),
              ),
              Tab(
                text: 'DONE',
                icon: Icon(Icons.check),
              )
            ]),
            Expanded(
              child: TabBarView(children: [
                Center(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: ((context, index) {
                      return !tasks[index].isDone
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.green, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(2, 2),
                                          blurRadius: 6)
                                    ]),
                                child: ListTile(
                                  title: Text(
                                    tasks[index].name,
                                    style: TextStyle(
                                        decoration: tasks[index].isDone
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none),
                                  ),
                                  subtitle: Text(
                                    tasks[index]
                                        .createdAt
                                        .toString()
                                        .substring(0, 10)
                                        .replaceAll('-', '/'),
                                    style: TextStyle(
                                        decoration: tasks[index].isDone
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none),
                                  ),
                                  trailing: Checkbox(
                                    value: tasks[index].isDone,
                                    onChanged: (value) {
                                      setState(() {
                                        tasks[index].isDone =
                                            !tasks[index].isDone;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    }),
                  ),
                ),
                Center(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: ((context, index) {
                      return tasks[index].isDone
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.green, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(2, 2),
                                          blurRadius: 6)
                                    ]),
                                child: ListTile(
                                  title: Text(
                                    tasks[index].name,
                                    style: TextStyle(
                                        decoration: tasks[index].isDone
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none),
                                  ),
                                  subtitle: Text(
                                    tasks[index]
                                        .createdAt
                                        .toString()
                                        .substring(0, 10)
                                        .replaceAll('-', '/'),
                                    style: TextStyle(
                                        decoration: tasks[index].isDone
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none),
                                  ),
                                  trailing: Checkbox(
                                    value: tasks[index].isDone,
                                    onChanged: (value) {
                                      setState(() {
                                        tasks[index].isDone =
                                            !tasks[index].isDone;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            )
                          : Container();
                    }),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: ((context) {
                return Dialog(
                  child: Container(
                    height: size.height * 0.5,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: const [
                              Text(
                                "NEW TASK",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: taskNameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              hintText: 'Task Name',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "PLEASE ENTER VALUE";
                              }

                              if (value.length <= 3) {
                                return "The Task Must be 4 chars at least";
                              }
                              if (value.length > 13) {
                                return "The Task Must be Max 13 char";
                              }
                            },
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    if (taskNameController.text.isNotEmpty) {
                                      tasks.add(TaskModel(
                                          name: taskNameController.text,
                                          isDone: false,
                                          createdAt: DateTime.now()));
                                      taskNameController.clear();

                                      Navigator.pop(context);
                                      setState(() {});
                                    }
                                  },
                                  child: const Text("ADD")),
                              const SizedBox(
                                width: 25,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("CANCEL")),
                              const SizedBox(
                                width: 25,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }));
        },
      ),
    );
  }
}
