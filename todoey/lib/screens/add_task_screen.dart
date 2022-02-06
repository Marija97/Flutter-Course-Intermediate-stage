import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

bool inputIsFine(taskContent) {
  if (taskContent != null) {
    if (taskContent.isNotEmpty) {
      return true;
    }
  }
  return false;
}

void onTaskAdded(context, taskContent) {}

class AddTaskScreen extends StatelessWidget {
  String? textFieldContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kInactiveScreenColor,
      child: Container(
        decoration: kRoundedBottomDecoration,
        padding: const EdgeInsets.all(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              style: kAddTaskStyle,
              textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              onChanged: (content) => textFieldContent = content,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                child: const Text('Add', style: TextStyle(fontSize: 15)),
                style: customButtonStyle,
                onPressed: () {
                  if (inputIsFine(textFieldContent)) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(textFieldContent!);
                  }
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
