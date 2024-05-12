import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  TextEditingController feedback = TextEditingController();
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("feedback");

  void sendFeedback() async {
    String feedbackText =
        feedback.text.trim(); // Trim to remove leading and trailing whitespaces

    if (feedbackText.isNotEmpty) {
      await collectionReference.add({
        'feedback': feedbackText,
        'timestamp': Timestamp.now(),
      }).then((_) {
        // Feedback sent successfully
        setState(() {
          feedback.clear(); // Clear the feedback text field
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Feedback sent successfully!'),
          ),
        );
      }).catchError((error) {
        // Handle errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send feedback. Please try again later.'),
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter your feedback before sending.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff7D48EA)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'We would love to hear your feedback!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: feedback,
              decoration: InputDecoration(
                labelText: 'Your Feedback',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  sendFeedback, // Call the sendFeedback function when the button is pressed
              child: Text('Send Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
