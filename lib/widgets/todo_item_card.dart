import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';
import 'package:todo_getx/screens/edit_todo.dart';

class TodoItemCard extends StatelessWidget {
  final int index;

  TodoItemCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final TodoController _controller = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Get.to(
            () => EditTodo(),
            arguments: [index, _controller.todos[index].title],
          );
        },
        child: Card(
          elevation: 4.0,
          margin: const EdgeInsets.all(0),
          child: Container(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
            child: Row(
              children: [
                Obx(
                  () => Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    activeColor: Colors.green,
                    value: _controller.todos[index].isDone,
                    onChanged: (done) {
                      var changed = _controller.todos[index];
                      changed.isDone = done!;
                      _controller.todos[index] = changed;
                    },
                  ),
                ),
                Expanded(
                  child: Text(
                    _controller.todos[index].title,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
