import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    required this.text,
    required this.onCBStateChanged,
    this.cbState = false,
    this.longPressed,
  });

  final String text;
  final bool cbState;
  final void Function(bool?) onCBStateChanged;
  final void Function()? longPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            decoration: cbState ? TextDecoration.lineThrough : null,
            fontSize: 20.0,
          ),
        ),
        trailing: Checkbox(value: cbState, onChanged: onCBStateChanged),
        onLongPress: longPressed,
      ),
    );
  }
}
