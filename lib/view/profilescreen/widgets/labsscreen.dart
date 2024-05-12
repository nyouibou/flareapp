// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Labs'),
      ),
      body: ListView(
        children: [
          LabItem(
            labName: 'Markerless Tracking',
            description:
                ' place virtual objects in your environment without needing special markers, making the experience feel more natural.',
          ),
          LabItem(
            labName: 'Environmental Understanding',
            description:
                "to analyze and interpret the user's surroundings to provide contextually relevant experiences.",
          ),
        ],
      ),
    );
  }
}

class LabItem extends StatelessWidget {
  final String labName;
  final String description;

  const LabItem({
    required this.labName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(labName),
      subtitle: Text(description),
      leading: CircleAvatar(
        child: Text(labName[
            0]), // Display the first character of the lab name as the avatar
      ),
      onTap: () {
        // Implement tapping on the lab item
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(labName),
              content: Text(description),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
