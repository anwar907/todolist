import 'package:flutter/material.dart';
import 'package:todolist/data/model/todo.dart';
import 'package:todolist/view/widgets/mark.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Todo> listData = [];
  TextEditingController textEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('scaffold'),
      appBar: AppBar(
        key: const Key('todo'),
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
          key: const Key('listview'),
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return DisableTextWidget(
              todo: listData[index],
              key: Key('${listData[index].title}'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        key: const Key('addButton'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add List Todo'),
                  content: Form(
                    key: formKey,
                    child: TextFormField(
                      controller: textEditingController,
                      decoration:
                          const InputDecoration(hintText: 'Type Your Todo'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Must not be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  actions: [
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: Theme.of(context).textTheme.labelLarge,
                      ),
                      child: const Text('Submit'),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            listData.add(Todo(
                                title: textEditingController.text,
                                avatar: textEditingController.text));
                          });
                          textEditingController.clear();
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                );
              });
        },
        tooltip: 'Add Data',
        child: const Icon(Icons.add),
      ),
    );
  }
}
