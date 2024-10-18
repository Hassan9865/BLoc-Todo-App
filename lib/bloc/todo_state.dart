import 'package:bloc_todo_app/todo_Model/todo.dart';

abstract class TodoState {}

class Todoinitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded({required this.todos});
}
