import 'package:flutter/material.dart';
import 'package:todo_list_with_dismissible/app/pages/todo_list_simple/controller/todo_list_simple_controller.dart';
import 'package:todo_list_with_dismissible/app/pages/todo_list_simple/todo_list_simple_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListSimplePage(
        controller: TodoListSimpleController(),
      ),
    );
  }
}