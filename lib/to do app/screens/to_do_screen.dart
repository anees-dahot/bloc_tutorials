import 'package:bloc_practice/to%20do%20app/bloc/todo_bloc.dart';
import 'package:bloc_practice/to%20do%20app/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do Screen'),
        backgroundColor: Colors.teal,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoBloc>().add(ToDoDialogBoxEvent());
        },
        focusColor: Colors.teal,
        splashColor: Colors.teal,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer(
        bloc: context.read<TodoBloc>(),
        buildWhen: (previous, current) => current is !TodoActionState,
        listenWhen: (previous, current) => current is TodoActionState,
        builder: (context, state) {
          if (state is TodoInitial) {
            return const Center(child: Text('No To Do'));
          } else if (state is ToDoLoadedState) {
            return ListView.builder(
              itemCount: state.toDo.length,
              itemBuilder: (context, index) {
                final toDO = state.toDo[index];

                return Card(
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        context.read<TodoBloc>().add(UpdateCompletionStatus(toDo: toDO));
                      },
                      child: toDO.isCompleted == true ? Icon(Icons.done, color: Colors.green,) : Icon(Icons.close, color: Colors.red),
                    ),
                    title: Text(toDO.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    subtitle: Text(toDO.body,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey)),
                    trailing: IconButton(
                        onPressed: () {
                          context
                              .read<TodoBloc>()
                              .add(RemoveTodoEvent(toDo: toDO));
                        },
                        icon: const Icon(Icons.delete, color: Colors.red)),
                  ),
                );
              },
            );
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: SizedBox());
          }
        },
        listener: (context, state) {
          if (state is TodoDialogBoxActionState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    context.read<TodoBloc>().add(ResetDialogStateEvent());
                    Navigator.of(context).pop();
                  },
                  child: AlertDialog(
                    title: const Text('Add To Do'),
                    content: Center(
                      child: Column(
                        children: [
                          TextField(
                            controller: title,
                            decoration: const InputDecoration(
                              labelText: 'Enter title',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: body,
                            decoration: const InputDecoration(
                              labelText: 'Enter description',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          context.read<TodoBloc>().add(ResetDialogStateEvent());
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Save'),
                        onPressed: () {
                          context.read<TodoBloc>().add(AddTodoEvent(
                              toDo: ToDoModel(
                                  title: title.text, body: body.text, isCompleted: false)));
                          context.read<TodoBloc>().add(ResetDialogStateEvent());
                          Navigator.of(context).pop();
                          title.clear();
                          body.clear();
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
