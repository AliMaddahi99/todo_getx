import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/controllers/todo_controller.dart';

class AddTodoTextField extends StatelessWidget {
  AddTodoTextField({Key? key}) : super(key: key);

  final TodoController _controller = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Obx(
        () => Row(
          children: [
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "What todo?",
                  ),
                  controller: _controller.addTodoTextEditingController,
                  focusNode: _controller.addTodoTextFieldFocusNode,
                  onChanged: (text) {
                    _controller.isTextFieldNotEmpty.value = text.isNotEmpty;
                  },
                  onSubmitted: _controller.isTextFieldNotEmpty.value
                      ? (text) => _controller.addTodo(title: text)
                      : null,
                ),
              ),
            ),
            IconButton(
              splashRadius: 1,
              onPressed: _controller.isTextFieldNotEmpty.value
                  ? () => _controller.addTodo(
                      title: _controller.addTodoTextEditingController.text)
                  : null,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
