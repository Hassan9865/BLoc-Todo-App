import 'package:bloc_todo_app/todo_Model/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(Todoinitial()) {
    on<AddTodo>((event, emit) {
      if (state is TodoLoaded) {
        final updatedTodos = List<Todo>.from((state as TodoLoaded).todos)
          ..add(Todo(
            id: Uuid().v4(),
            description: event.description,
          ));
        emit(TodoLoaded(todos: updatedTodos));
      } else {
        emit(TodoLoaded(todos: [
          Todo(
            id: Uuid().v4(),
            description: event.description,
          )
        ]));
      }
    });

    on<RemoveTodo>((event, emit) {
      if (state is TodoLoaded) {
        final updatedTodos = (state as TodoLoaded)
            .todos
            .where((todo) => todo.id != event.id)
            .toList();
        emit(TodoLoaded(todos: updatedTodos));
      }
    });
  }
}
