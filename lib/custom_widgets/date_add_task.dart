import 'package:flutter/material.dart';
import 'package:todo_app/Screens/add_task_screen.dart';
import 'package:todo_app/custom_widgets/app_button.dart';

class DateAndAddTaskRow extends StatelessWidget {
  const DateAndAddTaskRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "October 30, 2023",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Today",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 150,
          child: AppButton(
            title: "+ Add Task",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddTaskScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
