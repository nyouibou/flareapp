// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flareapp/view/first_screen/firstscreen.dart';
import 'package:flareapp/view/homescreen/homescreen.dart';
import 'package:flareapp/view/signupscreen/signup.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7D48EA),
      appBar: AppBar(
        backgroundColor: Color(0xff7D48EA),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Hello ,Again",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Phone Number",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Color(0xff7D48EA)),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "Password",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(color: Color(0xff7D48EA)),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 400,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            child: Container(
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Center(
                  child: Text(
                "Log In",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(112, 76, 190, 1)),
              )),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don’t have an account?",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
