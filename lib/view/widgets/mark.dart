import 'package:flutter/material.dart';
import 'package:todolist/data/model/todo.dart';
import 'package:todolist/extension/extension.dart';

class DisableTextWidget extends StatefulWidget {
  final Todo? todo;
  const DisableTextWidget({super.key, required this.todo});

  @override
  State<DisableTextWidget> createState() => _DisableTextWidgetState();
}

class _DisableTextWidgetState extends State<DisableTextWidget> {
  bool setLine = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          setLine = !setLine;
        });
      },
      title: Text(widget.todo?.title ?? '',
          style: const TextStyle().styledText(setLine)),
      leading: Container().decorationStyle(widget.todo!.avatar),
    );
  }
}


