import 'package:flutter/material.dart';

class LanguageSettings extends StatefulWidget {
  @override
  _LanguageSettingsState createState() => _LanguageSettingsState();
}

class _LanguageSettingsState extends State<LanguageSettings> {
  // List of available languages
  final List<String> _languages = ['English', 'Spanish', 'French', 'German', 'Chinese'];
  String? _selectedLanguage; // Variable to store the selected language

  @override
  void initState() {
    super.initState();
    _selectedLanguage = _languages[0]; // Set default selected language
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language Settings', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your preferred language:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  return _buildLanguageOption(_languages[index]);
                },
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save the selected language here
                // You can implement functionality to store the selected language in shared preferences or state management
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Language changed to $_selectedLanguage')),
                );
              },
              child: Text('Save Language'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0), // Button padding
                textStyle: TextStyle(fontSize: 18), // Button text style
                backgroundColor: Colors.blueAccent, // Button color
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    return RadioListTile<String>(
      title: Text(language, style: TextStyle(fontSize: 16)),
      value: language,
      groupValue: _selectedLanguage,
      activeColor: Colors.blueAccent, // Change color of the selected radio button
      onChanged: (value) {
        setState(() {
          _selectedLanguage = value;
        });
      },
    );
  }
}
