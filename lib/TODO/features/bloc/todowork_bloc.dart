import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';

import '../model/Todomodel.dart';

part 'todowork_event.dart';
part 'todowork_state.dart';

class TodoworkBloc extends Bloc<TodoworkEvent, TodoworkState> {
  TodoworkBloc() : super(TodoworkInitial()) {
    on<Addtodoevent>((event, emit) async {
      try {
        emit(TodoaddLoadingstate());

        await FirebaseFirestore.instance.collection("Firebasecollection").add({
          "name": event.todo.name,
          "place": event.todo.place,
        });
        emit(done());
      } catch (e) {
        emit(Todoerror(error: e.toString()));
      }
    });
  }
}
