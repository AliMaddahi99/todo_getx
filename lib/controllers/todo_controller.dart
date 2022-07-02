import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/data/todo_list.dart';
import 'package:todo_getx/models/todo_model.dart';

class TodoController extends GetxController {
  final TextEditingController addTodoTextEditingController =
      TextEditingController();

  List<TodoModel> todos = todoList.obs;
  var todoId = 0;

  void addTodo({required String title}) {
    // todos.insert(0, TodoModel(id: todoId.value, title: title));
    todos.add(TodoModel(id: todoId, title: title));
    todoId++;
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
