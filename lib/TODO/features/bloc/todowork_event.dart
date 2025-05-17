part of 'todowork_bloc.dart';

@immutable
sealed class TodoworkEvent {}

final class Addtodoevent extends TodoworkEvent {
  final Todo_model todo;
  Addtodoevent({required this.todo});
}

class FetchTodo extends TodoworkEvent {
  final String? searchQuery;
  bool isadd;
  FetchTodo({required this.searchQuery, required this.isadd});
}

class DeleteTodo extends TodoworkEvent {
  final String? id;
  DeleteTodo({required this.id});
}
