import 'package:flutter/material.dart';

class ThemeSettings extends StatefulWidget {
  @override
  _ThemeSettingsState createState() => _ThemeSettingsState();
}

class _ThemeSettingsState extends State<ThemeSettings> {
  // Variable to store the selected theme
  bool _isDarkTheme = false; // Default to light theme

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Settings', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose your preferred theme:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            _buildThemeOption('Light Theme', false),
            _buildThemeOption('Dark Theme', true),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Implement functionality to save the selected theme
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Theme changed to ${_isDarkTheme ? 'Dark' : 'Light'}')),
                );
              },
              child: Text('Save Theme'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(String title, bool isDarkTheme) {
    return RadioListTile<bool>(
      title: Text(title, style: TextStyle(fontSize: 16)),
      value: isDarkTheme,
      groupValue: _isDarkTheme,
      onChanged: (value) {
        setState(() {
          _isDarkTheme = value!;
        });
      },
    );
  }
}
