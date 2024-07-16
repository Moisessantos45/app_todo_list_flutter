import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/domains/entities/todoList.dart';
import 'package:todo_list/presentation/providers/todo_list_provider.dart';

class MyTodoList extends StatelessWidget {
  final TodoListEntiti todoList;
  const MyTodoList({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    final providerTodoList = context.watch<TodoListProvider>();
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
          child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, offset: Offset(0, 2), blurRadius: 2)
                  ]),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.check_circle,
                      color: todoList.isDone ? Colors.green : Colors.grey,
                      size: 30,
                    ),
                    onPressed: () {
                      final id = todoList.id;
                      providerTodoList.checkTodoList(id);
                    },
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: size.width * 0.7,
                    height: 30,
                    child: Text(
                      // Add this line (1/2)
                      todoList.text,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        final id = todoList.id;
                        providerTodoList.removeTodoList(id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      ))
                ],
              )),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
