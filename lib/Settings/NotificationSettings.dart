import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool _notificationsEnabled = true; // Variable to manage notification status
  bool _soundEnabled = true; // Variable for sound preference
  bool _vibrationEnabled = true; // Variable for vibration preference

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notifications Enable/Disable Switch
            SwitchListTile(
              title: Text('Enable Notifications', style: TextStyle(fontSize: 18)),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              activeColor: Colors.blueAccent,
            ),
            SizedBox(height: 16),

            // Sound Notification Option
            SwitchListTile(
              title: Text('Sound', style: TextStyle(fontSize: 18)),
              value: _soundEnabled,
              onChanged: _notificationsEnabled ? (bool value) {
                setState(() {
                  _soundEnabled = value;
                });
              } : null, // Disable if notifications are off
              activeColor: Colors.blueAccent,
            ),
            SizedBox(height: 16),

            // Vibration Notification Option
            SwitchListTile(
              title: Text('Vibration', style: TextStyle(fontSize: 18)),
              value: _vibrationEnabled,
              onChanged: _notificationsEnabled ? (bool value) {
                setState(() {
                  _vibrationEnabled = value;
                });
              } : null, // Disable if notifications are off
              activeColor: Colors.blueAccent,
            ),
            SizedBox(height: 16),

            // Save Button
            ElevatedButton(
              onPressed: () {
                // Save notification settings
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Notification settings updated')),
                );
              },
              child: Text('Save Settings'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(fontSize: 18),
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
