import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pranav/TODO/features/bloc/todowork_bloc.dart';
import 'package:pranav/firebase_options.dart';

import 'TODO/features/view/AddTodo.dart';
import 'TODO/features/view/ViewTodo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoworkBloc>(
          create:
              (context) =>
                  TodoworkBloc()
                    ..add(FetchTodo(searchQuery: null, isadd: false)),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pranav',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: Viewtodo(),
      ),
    );
  }
}
