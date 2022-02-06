import 'package:flutter/material.dart';
import 'task_card.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskCard(
              text: task.description,
              cbState: task.isDone,
              onCBStateChanged: (newCBState) => taskData.updateTaskState(task),
              longPressed: () => taskData.deleteTask(task),
            );
          }),
    );
  }
}
