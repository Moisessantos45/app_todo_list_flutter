import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list/domains/entities/todoList.dart';

class TodoListProvider extends ChangeNotifier {
  List<TodoListEntiti> listTodo = [
    // TodoListEntiti(id: 1, text: "Todo 1 app"),
    // TodoListEntiti(id: 2, text: "Todo 2 app"),
    // TodoListEntiti(id: 3, text: "Todo 3 app"),
    // TodoListEntiti(id: 4, text: "Todo 4 app"),
    // TodoListEntiti(id: 5, text: "Todo 5 app"),
    // TodoListEntiti(id: 6, text: "Todo 6 app"),
    // TodoListEntiti(id: 7, text: "Todo 7 app"),
    // TodoListEntiti(id: 8, text: "Todo 8 app"),
    // TodoListEntiti(id: 9, text: "Todo 9 app"),
    // TodoListEntiti(id: 10, text: "Todo 10 app"),
  ];

  final ScrollController todoListScrollController = ScrollController();

  int randomNumber() {
    Random ran = Random();

    int min = 1;
    int max = 1000;

    int numberRamdon = min + ran.nextInt(max - min);
    return numberRamdon;
  }

  Future<void> addTodoList(String texto) async {
    final idTodo = randomNumber();
    bool exist = listTodo.any((element) => element.id == idTodo);

    if (!exist) {
      final todoList = TodoListEntiti(id: idTodo, text: texto);
      listTodo.add(todoList);
      timeTodoLits();
    }
  }

  Future<void> removeTodoList(int id) async {
    listTodo.removeWhere((element) => element.id == id);
    timeTodoLits();
  }

  Future<void> checkTodoList(int id) async {
    final index = listTodo.indexWhere((element) => element.id == id);
    listTodo[index].isDone = !listTodo[index].isDone;
    timeTodoLits();
  }

  Future<void> timeTodoLits() async {
    await Future.delayed(Duration(milliseconds: 100));
    notifyListeners();
    todoListScrollController.animateTo(
        todoListScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }
}
