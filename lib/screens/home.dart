import 'package:flutter/material.dart';
import 'package:todo_getx/widgets/add_todo_text_field.dart';
import 'package:todo_getx/widgets/dismissible_card_listview.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo Getx",
        ),
      ),
      body: Column(
        children: [
          DismissibleCardListView(),
          AddTodoTextField(),
        ],
      ),
    );
  }
}
