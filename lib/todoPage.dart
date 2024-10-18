import 'package:bloc_todo_app/bloc/todo_bloc.dart';
import 'package:bloc_todo_app/bloc/todo_event.dart';
import 'package:bloc_todo_app/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Todopage extends StatelessWidget {
  const Todopage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController todocotroller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: Column(
        children: [
          TextField(
            controller: todocotroller,
          ),
          ElevatedButton(
              onPressed: () {
                if (todocotroller.text.isNotEmpty) {
                  context
                      .read<TodoBloc>()
                      .add(AddTodo(description: todocotroller.text));
                  todocotroller.clear();
                }
              },
              child: Text("Add")),
          Expanded(child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodoLoaded) {
                return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      final todo = state.todos[index];
                      return ListTile(
                        title: Text(todo.description),
                        trailing: IconButton(
                            onPressed: () {
                              context
                                  .read<TodoBloc>()
                                  .add(RemoveTodo(id: todo.id));
                            },
                            icon: Icon(Icons.delete)),
                      );
                    });
              } else {
                return Center(
                  child: Text("o TRodo yet"),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
