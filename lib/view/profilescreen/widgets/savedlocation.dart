import 'package:flutter/material.dart';

class SavedLocationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved Locations',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff7D48EA)),
        ),
      ),
      body: ListView(
        children: [
          SavedLocationItem(
            locationName: 'Home',
            address: '123 Main St, City, Country',
          ),
          SavedLocationItem(
            locationName: 'Work',
            address: '456 Business Ave, Town, Country',
          ),
          // Add more SavedLocationItems as needed
        ],
      ),
    );
  }
}

class SavedLocationItem extends StatelessWidget {
  final String locationName;
  final String address;

  const SavedLocationItem({
    required this.locationName,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(locationName),
      subtitle: Text(address),
      leading: Icon(Icons.location_on),
      onTap: () {
        // Implement tapping on the saved location
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(locationName),
              content: Text('Address: $address'),
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
