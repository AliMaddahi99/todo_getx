import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

class EditTodoController extends GetxController {
  final TextEditingController editTodoTextEditingController =
      TextEditingController();
  final FocusNode editTodoTextFieldFocusNode = FocusNode();

  final TodoController _controller = Get.find<TodoController>();

  var args = Get.arguments;

  @override
  void onInit() {
    editTodoTextEditingController.text =
        _controller.todos.isNotEmpty ? args[1] : "Nothing!";
    editTodoTextFieldFocusNode.requestFocus();
    super.onInit();
  }
}
