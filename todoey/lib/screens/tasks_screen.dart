import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kMainColor,
        onPressed: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
                // so that the new screen sits on keyboard
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen())),
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: kScaffoldPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(Icons.list, color: kMainColor, size: 30.0),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                const SizedBox(height: 10),
                const Text('Todoey', style: kLargeTitleTextStyle),
                const SizedBox(height: 5),
                Text('${Provider.of<TaskData>(context).taskCount} Tasks',
                    style: kTaskNumberTextStyle)
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: kListPadding,
              decoration: kRoundedBottomDecoration,
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
