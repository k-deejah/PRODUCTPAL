import 'package:flutter/material.dart';

class WeeklySummaryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> weeklyStats = [
    {"day": "Mon", "tasks": 4, "habits": 2},
    {"day": "Tue", "tasks": 3, "habits": 3},
    {"day": "Wed", "tasks": 2, "habits": 1},
    {"day": "Thu", "tasks": 5, "habits": 2},
    {"day": "Fri", "tasks": 3, "habits": 2},
    {"day": "Sat", "tasks": 1, "habits": 1},
    {"day": "Sun", "tasks": 0, "habits": 0},
  ];

  WeeklySummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Row(
              children: [
                Text("Daily", style: TextStyle(color: Colors.brown.shade400)),
                const SizedBox(width: 20),
                const Text(
                  "Weekly",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: weeklyStats.length,
              itemBuilder: (context, index) {
                final item = weeklyStats[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 6.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.brown[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item["day"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Tasks completed",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "${item["tasks"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Habits completed",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "${item["habits"]}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
