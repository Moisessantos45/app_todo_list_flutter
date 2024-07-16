class TodoListEntiti {
  int id;
  final String text;
  bool isDone = false;

  TodoListEntiti({required this.id, required this.text, this.isDone = false});
}
