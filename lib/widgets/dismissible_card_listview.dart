import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/widgets/todo_item_card.dart';

import '../controllers/todo_controller.dart';

class DismissibleCardListView extends StatelessWidget {
  DismissibleCardListView({Key? key}) : super(key: key);
  final TodoController _controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Dismissible(
                    key: Key(_controller.todos[index].id.toString()),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: Colors.red,
                      ),
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.white,
                      ),
                    ),
                    onDismissed: (_) {
                      _controller.deleteTodo(id: index);
                    },
                    child: TodoItemCard(
                      index: index,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                ],
              );
            },
            itemCount: _controller.todos.length,
          ),
        ),
      ),
    );
  }
}
