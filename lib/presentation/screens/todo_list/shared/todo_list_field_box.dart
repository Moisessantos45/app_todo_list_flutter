import 'package:flutter/material.dart';

class MyTodoListInput extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MyTodoListInput({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    return TextFormField(
      decoration: InputDecoration(
          hintText: "Add Todo",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
            icon: const Icon(Icons.add),
            style: ButtonStyle(iconSize: MaterialStateProperty.all(40)),
            hoverColor: Colors.blue,
            onPressed: () {
              final value = textController.value.text;
              textController.clear();
              if (!value.isEmpty) onValue(value);
            },
          )),
      controller: textController,
      onTapOutside: (e) => focusNode.unfocus(),
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        if (!value.isEmpty) onValue(value);
      },
    );
  }
}
