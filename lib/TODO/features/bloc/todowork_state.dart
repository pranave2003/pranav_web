part of 'todowork_bloc.dart';

@immutable
sealed class TodoworkState {}

final class TodoworkInitial extends TodoworkState {}

final class TodoaddLoadingstate extends TodoworkState {}

final class Todo_Loadedstate extends TodoworkState {
  final List<Todo_model> todo;
  Todo_Loadedstate({required this.todo});
}

final class Todoerror extends TodoworkState {
  final String error;
  Todoerror({required this.error});
}

final class done extends TodoworkState {}



final class ViewLoading extends TodoworkState{}
final class Refresh extends TodoworkState{}