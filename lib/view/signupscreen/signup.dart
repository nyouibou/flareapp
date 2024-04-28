// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flareapp/view/loginscreen/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController passwrd = TextEditingController();
  TextEditingController email = TextEditingController();
  final formkey = GlobalKey<FormState>();

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("users");
  XFile? pickedImage;
  var url = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7D48EA),
      appBar: AppBar(
        backgroundColor: Color(0xff7D48EA),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "create an account",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                pickedImage =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (pickedImage != null) {
                  final uniquename =
                      DateTime.now().microsecondsSinceEpoch.toString();
                  final storageRef = FirebaseStorage.instance.ref();
                  final imageRef = storageRef.child("users");
                  final uploadRef = imageRef.child("$uniquename");
                  await uploadRef.putFile(File(pickedImage!.path));
                  url = await uploadRef.getDownloadURL();
                  setState(() {});
                  if (url != null) {
                    log("upload successfully");
                  } else {
                    log("couldn't upload");
                  }
                }
              },
              child: CircleAvatar(
                radius: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
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
                            controller: name,
                            style: TextStyle(color: Color(0xff7D48EA)),
                            decoration: InputDecoration(
                              hintText: 'Name',
                              hintStyle: TextStyle(color: Color(0xff7D48EA)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                            controller: email,
                            style: TextStyle(color: Color(0xff7D48EA)),
                            decoration: InputDecoration(
                              hintText: 'E-Mail',
                              hintStyle: TextStyle(color: Color(0xff7D48EA)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                            controller: passwrd,
                            style: TextStyle(color: Color(0xff7D48EA)),
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Color(0xff7D48EA)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                try {
                  if (formkey.currentState!.validate()) {
                    final cred = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email.text,
                      password: passwrd.text,
                    );
                    collectionReference.add({
                      "username": name.text,
                      "image": url,
                    });
                    if (cred.user?.uid != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text("Failed to create Account, try again.."),
                        ),
                      );
                    }
                  }
                } catch (e) {
                  print("Error: $e");
                }
              },
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Center(
                    child: Text(
                  "Send",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(112, 76, 190, 1)),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
