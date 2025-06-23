import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Evening",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            Text("Khadijah", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: CircleAvatar(
                      backgroundColor:
                          index == 2 ? Colors.indigo : Colors.grey[200],
                      child: Text(
                        days[index],
                        style: TextStyle(
                          color: index == 2 ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Today Task",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.pushNamed(context, '/new-task');
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                TaskCard(title: "Design Meeting", color: Colors.pink[100]!),
                SizedBox(width: 10),
                TaskCard(
                  title: "Office Team Meeting",
                  color: Colors.blue[100]!,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("Today", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.calendar_today, color: Colors.indigo),
              title: Text("Design Meeting"),
              subtitle: Text("Today"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final Color color;

  const TaskCard({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Spacer(),
            Row(
              children: [
                CircleAvatar(radius: 10),
                SizedBox(width: 5),
                CircleAvatar(radius: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
