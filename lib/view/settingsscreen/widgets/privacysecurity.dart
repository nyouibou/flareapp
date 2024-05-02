import 'package:flutter/material.dart';

class PrivacySecurityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy & Security'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Privacy Policy'),
            leading: Icon(Icons.privacy_tip),
            onTap: () {
              // Implement navigating to privacy policy page
            },
          ),
          ListTile(
            title: Text('Terms of Service'),
            leading: Icon(Icons.gavel),
            onTap: () {
              // Implement navigating to terms of service page
            },
          ),
          ListTile(
            title: Text('Change Password'),
            leading: Icon(Icons.lock),
            onTap: () {
              // Implement changing password functionality
            },
          ),
          ListTile(
            title: Text('Two-Factor Authentication'),
            leading: Icon(Icons.security),
            onTap: () {
              // Implement two-factor authentication functionality
            },
          ),
          // Add more privacy and security settings as needed
        ],
      ),
    );
  }
}
