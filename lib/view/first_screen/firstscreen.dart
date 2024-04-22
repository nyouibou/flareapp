// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flareapp/view/camerascreen/arcamerascreen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7D48EA),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ARCameraScreen(),
                ));
          },
          child: Container(
            height: 60,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.video_camera_back,
                  color: Color(0xff7D48EA),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Scan",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(112, 76, 190, 1)),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
