// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SupportCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Support Center',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff7D48EA)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'For any inquiries or assistance, please feel free to contact us through the following methods:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.email, color: Color(0xff7D48EA)),
                title: Text('Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Text('flaretech@servicecent.com'),
                onTap: () {
                  // Handle email tapping
                },
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Color(0xff7D48EA)),
                title: Text('Phone',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Text('+1 123 456 7890'),
                onTap: () {
                  // Handle phone tapping
                },
              ),
              ListTile(
                leading: Icon(Icons.chat, color: Color(0xff7D48EA)),
                title: Text('Live Chat',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                onTap: () {
                  // Handle live chat tapping
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: Color(0xff7D48EA)),
                title: Text('Visit Us',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Text('1234 Support St, City, Country'),
                onTap: () {
                  // Handle visit us tapping
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
