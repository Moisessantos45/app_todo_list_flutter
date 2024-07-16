import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/config/themes/app_theme.dart';
import 'package:todo_list/presentation/providers/todo_list_provider.dart';
import 'package:todo_list/presentation/screens/todo_list/todo_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>TodoListProvider())],
      child: MaterialApp(
        title: 'Todo List',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectColor: 5).theme(),
        home:const TodoList(),
      ),
    );
  }
}