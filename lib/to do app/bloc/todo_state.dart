part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

abstract class TodoActionState extends TodoState {}

class TodoDialogBoxActionState extends TodoActionState {}

final class TodoInitial extends TodoState {}

final class ToDoLoadedState extends TodoState {
  final List<ToDoModel> toDo;

  const ToDoLoadedState({required this.toDo});
}

class LoadingState extends TodoState {}
