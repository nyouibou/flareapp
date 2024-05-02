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
            labName: 'Feature A',
            description: 'Description of Feature A.',
          ),
          LabItem(
            labName: 'Feature B',
            description: 'Description of Feature B.',
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
