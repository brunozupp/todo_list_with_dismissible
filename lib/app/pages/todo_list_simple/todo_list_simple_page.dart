import 'package:flutter/material.dart';

import 'package:todo_list_with_dismissible/app/pages/todo_list_simple/controller/todo_list_simple_controller.dart';
import 'package:todo_list_with_dismissible/app/pages/todo_list_simple/widgets/chart_simple_widget.dart';
import 'package:todo_list_with_dismissible/app/pages/todo_list_simple/widgets/todo_list_simple_widget.dart';

class TodoListSimplePage extends StatelessWidget {

  final TodoListSimpleController controller;

  const TodoListSimplePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List Simple"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TodoListSimpleWidget(controller: controller),
            const SizedBox(
              height: 20,
            ),
            ChartSimpleWidget(controller: controller),
          ],
        ),
      ),
    );
  }
}
