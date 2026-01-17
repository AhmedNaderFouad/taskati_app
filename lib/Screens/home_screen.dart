import 'package:flutter/material.dart';
import 'package:todo_app/Screens/add_task_screen.dart';
import 'package:todo_app/custom_widgets/app_button.dart';
import 'package:todo_app/custom_widgets/date_container.dart';
import 'package:todo_app/custom_widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedDateIndex = 0;
  List<Map<String, dynamic>> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Hello, Nader",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Have a Nice Day",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.person, color: Colors.white, size: 40),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              
              Row(
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
                      onPressed: () async {
                        final newTask = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddTaskScreen(),
                          ),
                        );

                        if (newTask != null && newTask is Map<String, dynamic>) {
                          setState(() {
                            tasks.add(newTask);
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DateContainer(
                      month: "OCT",
                      day: "30",
                      weekDay: "MON",
                      isActive: selectedDateIndex == 0,
                      onTap: () => setState(() => selectedDateIndex = 0),
                    ),
                    const SizedBox(width: 15),
                    DateContainer(
                      month: "OCT",
                      day: "31",
                      weekDay: "TUE",
                      isActive: selectedDateIndex == 1,
                      onTap: () => setState(() => selectedDateIndex = 1),
                    ),
                    const SizedBox(width: 15),
                    DateContainer(
                      month: "NOV",
                      day: "01",
                      weekDay: "WED",
                      isActive: selectedDateIndex == 2,
                      onTap: () => setState(() => selectedDateIndex = 2),
                    ),
                    const SizedBox(width: 15),
                    DateContainer(
                      month: "NOV",
                      day: "02",
                      weekDay: "THU",
                      isActive: selectedDateIndex == 3,
                      onTap: () => setState(() => selectedDateIndex = 3),
                    ),
                    const SizedBox(width: 15),
                    DateContainer(
                      month: "NOV",
                      day: "03",
                      weekDay: "FRI",
                      isActive: selectedDateIndex == 4,
                      onTap: () => setState(() => selectedDateIndex = 4),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              
              tasks.isEmpty 
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        "No tasks yet! Tap + Add Task to start.",
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return TaskItem(
                        title: task["title"],
                        date: task["time"],
                        description: task["description"],
                        color: task["color"],
                        isCompleted: task["isCompleted"],
                        onTap: () {
                          setState(() {
                            tasks[index]["isCompleted"] = !tasks[index]["isCompleted"];
                          });
                        },
                        onDismissed: (direction) {
                          setState(() {
                            tasks.removeAt(index);
                          });
                        },
                      );
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
