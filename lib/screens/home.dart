import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/widgets/add_todo_text_field.dart';
import 'package:todo_getx/widgets/todo_item_card.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final TodoController _controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo Getx",
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => TodoItemCard(
                  index: index,
                  todo: _controller.todos[index],
                ),
                itemCount: _controller.todos.length,
              ),
            ),
          ),
          AddTodoTextField(),
        ],
      ),
    );
  }
}
