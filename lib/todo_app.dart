import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/screens/home.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: "TodoAppGetx",
      home: Home(),
    );
  }
}
