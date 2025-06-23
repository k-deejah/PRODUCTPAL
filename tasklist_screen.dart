import 'package:flutter/material.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<Map<String, String>> activities = [
    {"title": "Solah Time", "time": "5:00 - 6:00"},
    {"title": "Morning Reflection", "time": "6:00 AM", "completed": "false"},
    {"title": "Breakfast", "time": "7:00 AM", "completed": "false"},
    {"title": "Work on Project", "time": "9:00 AM", "completed": "false"},
    {"title": "Team Meeting", "time": "11:00 AM", "completed": "false"},
    {"title": "Lunch Break", "time": "1:00 PM", "completed": "false"},
    {"title": "Read Book", "time": "3:00 PM", "completed": "false"},
    {"title": "Exercise", "time": "5:00 PM", "completed": "false"},
    {"title": "Classes", "time": "8:00 - 11:00"},
    {"title": "Project", "time": "11:00 - 2:00"},
    {"title": "Lunch", "time": "2:00 - 3:00"},
    {"title": "Study", "time": "3:00 - 5:00"},
    {"title": "Dinner", "time": "6:00 - 7:00"},
    {"title": "Relax", "time": "7:00 - 9:00"},
    {"title": "Sleep", "time": "9:00 - 5:00"},

    {"title": "Solah Time", "time": "5:00 - 6:00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task List")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search activities',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sort By:"),
                DropdownButton<String>(
                  items:
                      ['Date', 'Priority', 'Completed']
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == 'Date') {
                        activities.sort(
                          (a, b) => a['time']!.compareTo(b['time']!),
                        );
                      } else if (value == 'Priority') {
                      } else if (value == 'Completed') {
                        activities.sort(
                          (a, b) => a['completed']!.compareTo(b['completed']!),
                        );
                      }
                    });
                  },
                  hint: Text("Date"),
                ),
              ],
            ),

            SizedBox(height: 10),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return Card(
                    child: ListTile(
                      title: Text(activity["title"]!),
                      subtitle: Text(activity["time"]!),
                      trailing: Checkbox(
                        value: activity["completed"] == "true",
                        onChanged: (val) {
                          setState(() {
                            activity["completed"] = val.toString();
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 10, width: 10),
            ElevatedButton(onPressed: () {}, child: Text("Add Activity")),
          ],
        ),
      ),
    );
  }
}
