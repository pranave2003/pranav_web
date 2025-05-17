import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pranav/TODO/features/bloc/todowork_bloc.dart';

import 'AddTodo.dart';

class Viewtodo extends StatefulWidget {
  const Viewtodo({super.key});

  @override
  State<Viewtodo> createState() => _ViewtodoState();
}

class _ViewtodoState extends State<Viewtodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Addtodo();
              },
            ),
          );
        },
      ),
      appBar: AppBar(
        title: const Text('View todo'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.teal.shade50],
          ),
        ),
        child: BlocConsumer<TodoworkBloc, TodoworkState>(
          listener: (context, state) {
            if (state is Refresh) {
              context.read<TodoworkBloc>()
                ..add(FetchTodo(searchQuery: null, isadd: true));
            }
          },
          builder: (context, state) {
            if (state is TodoaddLoadingstate) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is Todo_Loadedstate) {
              final todos = state.todo;

              if (todos.isEmpty) {
                return const Center(child: Text("No todos available."));
              }

              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: ListTile(
                      title: Text(todo.name ?? "No Name"),
                      subtitle: Text(todo.place ?? "No Place"),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<TodoworkBloc>()
                            ..add(DeleteTodo(id: todo.id));
                        },
                        icon: Icon(Icons.delete, color: Colors.red[600]),
                      ),
                    ),
                  );
                },
              );
            } else if (state is Todoerror) {
              return Center(child: Text("Error: ${state.error}"));
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
