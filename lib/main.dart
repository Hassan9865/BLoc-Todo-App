import 'package:bloc_todo_app/bloc/todo_bloc.dart';
import 'package:bloc_todo_app/cubit/todo_cubit.dart';
import 'package:bloc_todo_app/todoPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => TodoCubit(),
          child: Todopage(),
        ));
  }
}
