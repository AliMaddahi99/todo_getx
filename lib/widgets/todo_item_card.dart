import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

class TodoItemCard extends StatelessWidget {
  final int index;

  TodoItemCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final TodoController _controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
