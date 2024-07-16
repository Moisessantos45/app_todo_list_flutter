import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/presentation/providers/todo_list_provider.dart';
import 'package:todo_list/presentation/screens/todo_list/shared/todo_list_field_box.dart';
import 'package:todo_list/presentation/widgets/todos/my_todo_list.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage("https://i.ibb.co/vVYw6B9/bg-Makabe-shizuru.webp"),
          ),
        ),
        title: const Text(
          "Todo List",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _TodoListView(),
    );
  }
}

class _TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerTodoList = context.watch<TodoListProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            MyTodoListInput(onValue: providerTodoList.addTodoList),
            Expanded(
              child: ListView.builder(
                  controller: providerTodoList.todoListScrollController,
                  itemBuilder: (context, index) {
                    final todo = providerTodoList.listTodo[index];
                    return MyTodoList(
                      todoList: todo,
                    );
                  },
                  itemCount: providerTodoList.listTodo.length),
            )
          ],
        ),
      ),
    );
  }
}
