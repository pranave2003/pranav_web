import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pranav/TODO/features/model/Todomodel.dart';
import '../bloc/todowork_bloc.dart';

class Addtodo extends StatefulWidget {
  const Addtodo({super.key});

  @override
  State<Addtodo> createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  final _formKey = GlobalKey<FormState>();
  final _todoNameController = TextEditingController();
  final _placeController = TextEditingController();

  @override
  void dispose() {
    _todoNameController.dispose();
    _placeController.dispose();
    super.dispose();
  }

  // void _submitForm() {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //
  //     // Simulate API call or database operation
  //     Future.delayed(const Duration(seconds: 1), () {
  //       if (mounted) {
  //         setState(() {
  //           _isLoading = false;
  //         });
  //
  //         // Show success message
  //
  //         // Clear form
  //         _todoNameController.clear();
  //         _placeController.clear();
  //       }
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      appBar: AppBar(
        title: const Text('Add New Todo'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.teal.shade50, Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                const Text(
                  'Create a New Task',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Add details about your new todo item',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),

                // Todo Name Field
                TextFormField(
                  controller: _todoNameController,
                  decoration: InputDecoration(
                    labelText: 'Todo Name',
                    hintText: 'Enter task name',
                    prefixIcon: const Icon(Icons.task_alt, color: Colors.teal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.teal,
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a task name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Place Field
                TextFormField(
                  controller: _placeController,
                  decoration: InputDecoration(
                    labelText: 'Place',
                    hintText: 'Enter location',
                    prefixIcon: const Icon(Icons.place, color: Colors.teal),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.teal,
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // Submit Button
                BlocConsumer<TodoworkBloc, TodoworkState>(
                  listener: (context, state) {
                    if (state is Todoerror) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                    if (state is done) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added"),
                          backgroundColor: Colors.green,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        final todo = Todo_model(
                          id: "id",
                          name: _todoNameController.text,
                          place: _placeController.text,
                        );
                        if (_formKey.currentState!.validate()) {
                          context.read<TodoworkBloc>()
                            ..add(Addtodoevent(todo: todo));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                      ),
                      child:
                          state is TodoaddLoadingstate
                              ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text('Adding...'),
                                ],
                              )
                              : const Text(
                                'Add Todo',
                                style: TextStyle(fontSize: 16),
                              ),
                    );
                  },
                ),

                // Optional: Add a cancel button
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    // Clear form or navigate back
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
