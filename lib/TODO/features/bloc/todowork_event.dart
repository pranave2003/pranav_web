part of 'todowork_bloc.dart';

@immutable
sealed class TodoworkEvent {}


final class Addtodoevent extends TodoworkEvent{
  final Todo_model todo;
  Addtodoevent({required this.todo});
}
