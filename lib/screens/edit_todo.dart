import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import '../controllers/edit_todo_controller.dart';

class EditTodo extends StatelessWidget {
  EditTodo({Key? key}) : super(key: key);

  final EditTodoController _editTodoController = Get.put(EditTodoController());
  final TodoController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 4.0,
            )
          ],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: TextField(
          decoration: const InputDecoration(
            hintText: "Edit todo title",
            border: InputBorder.none,
          ),
          controller: _editTodoController.editTodoTextEditingController,
          focusNode: _editTodoController.editTodoTextFieldFocusNode,
          onChanged: (text) {
            var id = _editTodoController.args[0];
            var edited = _controller.todos[id];
            edited.title = text;
            _controller.todos[id] = edited;
          },
        ),
      ),
    );
  }
}
