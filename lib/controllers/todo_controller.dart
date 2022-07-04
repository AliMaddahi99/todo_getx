import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_getx/models/todo_model.dart';

class TodoController extends GetxController {
  final TextEditingController addTodoTextEditingController =
      TextEditingController();
  final FocusNode addTodoTextFieldFocusNode = FocusNode();

  var isTextFieldNotEmpty = false.obs;
  var todos = <TodoModel>[].obs;
  var _todoId = 0;

  void addTodo({required String title}) {
    // todos.add(TodoModel(id: _todoId, title: title));
    addTodoTextEditingController.clear();

    isTextFieldNotEmpty.value = false;

    todos.insert(0, TodoModel(id: _todoId, title: title));
    _todoId++;

    addTodoTextFieldFocusNode.requestFocus();
  }

  void deleteTodo({required int id}) {
    todos.removeAt(id);
  }

  @override
  void onInit() {
    var storedTodos = GetStorage().read<List>("todos");
    if (storedTodos != null) {
      todos = storedTodos.map((e) => TodoModel.fromJson(e)).toList().obs;
    }

    ever(todos, (_) {
      GetStorage().write("todos", todos.toList());
    });
    super.onInit();
  }
}
