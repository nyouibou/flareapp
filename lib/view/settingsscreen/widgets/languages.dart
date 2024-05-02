import 'package:flutter/material.dart';

class LanguagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Languages'),
      ),
      body: ListView(
        children: [
          LanguageItem(
            language: 'English',
            countryCode: 'US',
          ),
          LanguageItem(
            language: 'Spanish',
            countryCode: 'ES',
          ),
          LanguageItem(
            language: 'French',
            countryCode: 'FR',
          ),
          LanguageItem(
            language: 'German',
            countryCode: 'DE',
          ),
          LanguageItem(
            language: 'Italian',
            countryCode: 'IT',
          ),
          LanguageItem(
            language: 'Portuguese',
            countryCode: 'PT',
          ),
          LanguageItem(
            language: 'Russian',
            countryCode: 'RU',
          ),
          LanguageItem(
            language: 'Chinese',
            countryCode: 'CN',
          ),
          // Add more languages as needed
        ],
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  final String language;
  final String countryCode;

  const LanguageItem({
    required this.language,
    required this.countryCode,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(language),
      leading: CircleAvatar(
        child: Text(
          countryCode,
          style: TextStyle(fontSize: 16),
        ),
      ),
      onTap: () {
        // Implement language selection logic
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Selected Language'),
              content: Text('You have selected $language'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: LanguagesPage(),
  ));
}
