import 'package:flutter/material.dart';
import 'package:productpal/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ValueListenableBuilder<bool>(
        valueListenable: isDarkModeNotifier,
        builder: (context, isDark, child) {
          return ListView(
            children: [
              ListTile(
                title: Text('Profile'),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: Text('My Plan'),
                trailing: Icon(Icons.arrow_forward),
              ),
              Divider(),
              ListTile(
                title: Text('General'),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: Text('Data Control'),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                title: Text('Reminders'),
                trailing: Icon(Icons.arrow_forward),
              ),
              SwitchListTile(
                title: Text('Theme'),
                value: isDark,
                onChanged: (value) {
                  isDarkModeNotifier.value = value;
                },
              ),
              ListTile(
                title: Text('Advanced'),
                trailing: Icon(Icons.arrow_forward),
              ),
              Divider(),
              ListTile(
                title: Text('Support'),
                trailing: Icon(Icons.arrow_forward),
              ),

              ListTile(title: Text('Sign Out'), trailing: Icon(Icons.logout)),
            ],
          );
        },
      ),
    );
  }
}
