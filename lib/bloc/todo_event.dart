abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final String description;
  AddTodo({required this.description});
}

class RemoveTodo extends TodoEvent {
  final String id;

  RemoveTodo({required this.id});
}
