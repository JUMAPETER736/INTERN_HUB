


import 'package:flutter/material.dart';



class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent[200]!, Colors.blueAccent[400]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              _buildSettingItem(
                icon: Icons.notifications,
                title: 'Notification Settings',
                onTap: () {
                  Navigator.pushNamed(context, '/NotificationSettings');
                },
              ),
              _buildSettingItem(
                icon: Icons.language,
                title: 'Language Settings',
                onTap: () {
                  Navigator.pushNamed(context, '/LanguageSettings');
                },
              ),
              _buildSettingItem(
                icon: Icons.format_paint,
                title: 'Theme Settings',
                onTap: () {
                  Navigator.pushNamed(context, '/ThemeSettings');
                },
              ),
              _buildSettingItem(
                icon: Icons.privacy_tip,
                title: 'Privacy Policy',
                onTap: () {
                  Navigator.pushNamed(context, '/PrivacyPolicy');
                },
              ),
              _buildSettingItem(
                icon: Icons.assignment,
                title: 'Terms of Service',
                onTap: () {
                  Navigator.pushNamed(context, '/TermsOfService');
                },
              ),
              _buildSettingItem(
                icon: Icons.support,
                title: 'Support',
                onTap: () {
                  Navigator.pushNamed(context, '/Support');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({required IconData icon, required String title, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, size: 30, color: Colors.blueAccent),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
