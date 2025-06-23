import 'package:flutter/material.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final List<String> categories = [
    "Marketing",
    "Meeting",
    "Dev",
    "Mobile",
    "UI Design",
    "HTML",
    "Graphic Design",
    "Android App",
    "iOS App",
    "Magento",
    "SEO",
  ];
  String selectedCategory = "UI Design";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildInputLabel("Title"),
            buildTextField("UI Design"),
            buildInputLabel("Date"),
            buildTextField("Tuesday, 22 Sep 2020"),
            buildInputLabel("Start Time"),
            buildTimeField("1:00 PM"),
            buildInputLabel("End Time"),
            buildTimeField("3:00 PM"),
            buildInputLabel("Description"),
            buildTextField(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            ),
            buildInputLabel("Category"),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  categories
                      .map(
                        (cat) => ChoiceChip(
                          label: Text(cat),
                          selected: selectedCategory == cat,
                          onSelected: (_) {
                            setState(() {
                              selectedCategory = cat;
                            });
                          },
                        ),
                      )
                      .toList(),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              child: Text("Create New Task"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  Widget buildTextField(String hint) {
    return TextFormField(
      initialValue: hint,
      decoration: InputDecoration(border: OutlineInputBorder()),
    );
  }

  Widget buildTimeField(String hint) {
    return TextFormField(
      initialValue: hint,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.access_time),
      ),
    );
  }
}
