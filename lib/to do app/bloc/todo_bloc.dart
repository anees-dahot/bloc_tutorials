import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/to%20do%20app/model/todo.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<AddTodoEvent>(addTodoEvent);
    on<ToDoDialogBoxEvent>(toDoDialogBoxEvent);
    on<ToDoLoadedEvent>(toDoLoadedEvent);
    on<RemoveTodoEvent>(removeTodoEvent);
    on<ResetDialogStateEvent>(resetDialogStateEvent);
    on<UpdateCompletionStatus>(updateCompletionStatus);
  }
  List<ToDoModel> list = [];

  FutureOr<void> addTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) {
    list.add(event.toDo);
    emit(ToDoLoadedState(toDo: List.from(list)));
  }

  FutureOr<void> removeTodoEvent(
      RemoveTodoEvent event, Emitter<TodoState> emit) async {
    list.remove(event.toDo);
    emit(LoadingState());
    await Future.delayed(Duration(microseconds: 200));
    emit(ToDoLoadedState(toDo: List.from(list)));
  }

  FutureOr<void> resetDialogStateEvent(
      ResetDialogStateEvent event, Emitter<TodoState> emit) {
    emit(ToDoLoadedState(toDo: List.from(list)));
  }

  FutureOr<void> toDoLoadedEvent(
      ToDoLoadedEvent event, Emitter<TodoState> emit) {
    emit(ToDoLoadedState(toDo: List.from(list)));
  }

  FutureOr<void> toDoDialogBoxEvent(
      ToDoDialogBoxEvent event, Emitter<TodoState> emit) {
    emit(TodoDialogBoxActionState());
  }

  FutureOr<void> updateCompletionStatus(UpdateCompletionStatus event, Emitter<TodoState> emit) {
    event.toDo.isCompleted = !event.toDo.isCompleted;
      emit(LoadingState());
    emit(ToDoLoadedState(toDo: List.from(list)));
  }
}
