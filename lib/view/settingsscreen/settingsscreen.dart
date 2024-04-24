// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff7D48EA)),
          ),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Login Settings'),
              leading: Image.asset(
                "images/Location.png",
                scale: 20,
              ),
              trailing: Icon(
                Icons.arrow_forward,
              ),
              onTap: () {
                // Navigate to notification settings page
                // Implement your navigation logic here
              },
            ),
            ListTile(
              title: Text('Support Centre'),
              leading: Image.asset(
                "images/Layout.png",
                scale: 20,
              ),
              trailing: Icon(
                Icons.arrow_forward,
              ),
              onTap: () {
                // Navigate to privacy settings page
                // Implement your navigation logic here
              },
            ),
            ListTile(
              title: Text('Privacy and Security'),
              leading: Image.asset(
                "images/Envelope.png",
                scale: 20,
              ),
              trailing: Icon(
                Icons.arrow_forward,
              ),
              onTap: () {
                // Navigate to account settings page
                // Implement your navigation logic here
              },
            ), // Divider for visual separation
            ListTile(
              title: Text('Language'),
              leading: Image.asset(
                "images/Envelope.png",
                scale: 20,
              ),
              trailing: Icon(
                Icons.arrow_forward,
              ),
              onTap: () {
                // Navigate to about page
                // Implement your navigation logic here
              },
            ),
            ListTile(
              title: Text('Notifications'),
              leading: Image.asset(
                "images/Envelope.png",
                scale: 20,
              ),
              trailing: Icon(
                Icons.arrow_forward,
              ),
              onTap: () {
                // Navigate to help & feedback page
                // Implement your navigation logic here
              },
            ),
            SizedBox(
              height: 270,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff7D48EA)),
                child: Center(
                    child: Text(
                  "Go To Premium",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
