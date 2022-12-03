import 'package:flutter/material.dart';
import 'package:todo_app_challange/models/task_model.dart';
import 'package:todo_app_challange/widgets/main_button.dart';
import 'package:todo_app_challange/widgets/task_card.dart';

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
        actions: [
          if (tasks.isNotEmpty)
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: SizedBox(
                            height: size.height * 0.33,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text(
                                      "are you sure you want to clear the tasks ?"),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      MainButton(
                                          title: 'YES',
                                          onPressed: () {
                                            setState(() {
                                              tasks.clear();
                                            });
                                            Navigator.pop(context);
                                          }),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      MainButton(
                                          title: 'CANCEL',
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
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
                      });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ))
        ],
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
                          ? TaskCard(taskModel: tasks[index])
                          : Container();
                    }),
                  ),
                ),
                Center(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: ((context, index) {
                      return tasks[index].isDone
                          ? TaskCard(taskModel: tasks[index])
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
                  child: SizedBox(
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
                              return null;
                            },
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              MainButton(
                                  title: 'ADD',
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
                                  }),
                              const SizedBox(
                                width: 25,
                              ),
                              MainButton(
                                  title: 'CANCEL',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
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
