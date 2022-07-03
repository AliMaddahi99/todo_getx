import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/data/todo_list.dart';
import 'package:todo_getx/models/todo_model.dart';

class TodoController extends GetxController {
  final TextEditingController addTodoTextEditingController =
      TextEditingController();
  final FocusNode addTodoTextFieldFocusNode = FocusNode();

  var isTextFieldNotEmpty = false.obs;

  List<TodoModel> todos = todoList.obs;
  var _todoId = 0;

  void addTodo({required String title}) {
    // todos.add(TodoModel(id: _todoId, title: title));
    addTodoTextEditingController.clear();

    isTextFieldNotEmpty.value = false;

    todos.insert(0, TodoModel(id: _todoId, title: title));
    _todoId++;

    addTodoTextFieldFocusNode.requestFocus();
  }

  void editTodoTitle({required int id, required String newTitle}) {
    todos[id].title = newTitle;
  }

  void deleteTodo({required int id}) {
    todos.removeAt(id);
  }

  void isTodoDone({required int id, required bool isDone}) {
    todos[id].isDone = isDone;
  }
}
