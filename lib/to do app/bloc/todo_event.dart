part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class ToDoDialogBoxEvent extends TodoEvent {}

class ToDoLoadedEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final ToDoModel toDo;
  const AddTodoEvent({required this.toDo});
}

class RemoveTodoEvent extends TodoEvent {
  final ToDoModel toDo;

  RemoveTodoEvent({required this.toDo});
}

class UpdateCompletionStatus extends TodoEvent {
  final ToDoModel toDo;

  UpdateCompletionStatus({required this.toDo});
}

class ResetDialogStateEvent extends TodoEvent {}
