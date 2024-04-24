// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff7D48EA)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/236x/85/54/a7/8554a77f74c4098e6607c7119591ac45.jpg"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Shin-chan",
                                style: TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.bold),
                              ),
                              Text("Joined 5 weeks ago",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff787878))),
                            ],
                          ),
                        ),
                        Image.asset(
                          "images/Edit.png",
                          scale: 22,
                        )
                      ],
                    )
                  ],
                ),
              ),
              // SizedBox(
              //     height:
              //         20), // Add some space between the avatar and the list settings
              ListTile(
                leading: Image.asset(
                  "images/Location.png",
                  scale: 20,
                ),
                title: Text(
                  'Saved Locations',
                  style: TextStyle(fontSize: 16),
                ),
                trailing: Icon(Icons.arrow_forward, color: Color(0xff7D48EA)),
                onTap: () {
                  // Handle tapping on Settings
                },
              ),
              ListTile(
                leading: Image.asset(
                  "images/Layout.png",
                  scale: 20,
                ),
                title: Text('Orders', style: TextStyle(fontSize: 16)),
                trailing: Icon(Icons.arrow_forward, color: Color(0xff7D48EA)),
                onTap: () {
                  // Handle tapping on Privacy
                },
              ),
              ListTile(
                leading: Image.asset(
                  "images/Envelope.png",
                  scale: 20,
                ),
                title: Text('Messages', style: TextStyle(fontSize: 16)),
                trailing: Icon(Icons.arrow_forward, color: Color(0xff7D48EA)),
                onTap: () {
                  // Handle tapping on Notifications
                },
              ),
              ListTile(
                leading: Image.asset(
                  "images/Trash.png",
                  scale: 20,
                ),
                title: Text('Delete Account', style: TextStyle(fontSize: 16)),
                trailing: Icon(Icons.arrow_forward, color: Color(0xff7D48EA)),
                onTap: () {
                  // Handle tapping on Notifications
                },
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff7D48EA))),
                    child: Center(
                        child: Text(
                      "Sign Out",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7D48EA)),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
