// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Notification Settings'),
            trailing: Icon(Icons.notifications),
            onTap: () {
              // Navigate to notification settings page
              // Implement your navigation logic here
            },
          ),
          ListTile(
            title: Text('Privacy Settings'),
            trailing: Icon(Icons.privacy_tip),
            onTap: () {
              // Navigate to privacy settings page
              // Implement your navigation logic here
            },
          ),
          ListTile(
            title: Text('Account Settings'),
            trailing: Icon(Icons.account_circle),
            onTap: () {
              // Navigate to account settings page
              // Implement your navigation logic here
            },
          ),
          Divider(), // Divider for visual separation
          ListTile(
            title: Text('About'),
            trailing: Icon(Icons.info),
            onTap: () {
              // Navigate to about page
              // Implement your navigation logic here
            },
          ),
          ListTile(
            title: Text('Help & Feedback'),
            trailing: Icon(Icons.help),
            onTap: () {
              // Navigate to help & feedback page
              // Implement your navigation logic here
            },
          ),
          Divider(), // Divider for visual separation
          ListTile(
            title: Text('Logout'),
            trailing: Icon(Icons.exit_to_app),
            onTap: () {
              // Implement logout functionality
            },
          ),
        ],
      ),
    );
  }
}
