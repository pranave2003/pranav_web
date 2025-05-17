import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../model/Todomodel.dart';
part 'todowork_event.dart';
part 'todowork_state.dart';

class TodoworkBloc extends Bloc<TodoworkEvent, TodoworkState> {
  TodoworkBloc() : super(TodoworkInitial()) {
    on<Addtodoevent>((event, emit) async {
      try {
        emit(TodoaddLoadingstate());

        // Generate a specific docId
        final docRef =
            FirebaseFirestore.instance.collection("Firebasecollection").doc();

        await docRef.set({
          "name": event.todo.name,
          "place": event.todo.place,
          "id": docRef.id, // Store the generated docId
        });

        emit(done());
        emit(Refresh());
      } catch (e) {
        emit(Todoerror(error: e.toString()));
      }
    });

    on<FetchTodo>((event, emit) async {
      emit(ViewLoading());
      try {
        CollectionReference Todo = FirebaseFirestore.instance.collection(
          'Firebasecollection',
        );

        Query query = Todo;
        QuerySnapshot snapshot = await query.get();

        List<Todo_model> tododata =
            snapshot.docs.map((doc) {
              return Todo_model.fromMap(doc.data() as Map<String, dynamic>);
            }).toList();

        if (event.searchQuery != null && event.searchQuery!.isNotEmpty) {
          tododata =
              tododata.where((University) {
                return University.name!.toLowerCase().contains(
                  event.searchQuery!.toLowerCase(),
                );
              }).toList();
        }

        emit(Todo_Loadedstate(todo: tododata));
      } catch (e) {
        emit(Todoerror(error: e.toString()));
      }
    });

    on<DeleteTodo>((event, emit) async {
      FirebaseFirestore.instance
          .collection("Firebasecollection")
          .doc(event.id)
          .delete();

      emit(Refresh());
    });
  }
}
