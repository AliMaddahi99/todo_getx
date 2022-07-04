import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_getx/todo_app.dart';

void main() async {
  await GetStorage.init();
  runApp(const TodoApp());
}
