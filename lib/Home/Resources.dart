import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Make sure to add this package to your pubspec.yaml

class Resources extends StatelessWidget {
  final List<Map<String, String>> resources = [
    {
      'title': 'Internship Opportunities',
      'description': 'Explore various internship opportunities in your field.',
      'url': 'https://www.example.com/internships' // Replace with actual URL
    },
    {
      'title': 'Resume Building Guide',
      'description': 'Learn how to build an effective resume.',
      'url': 'https://www.example.com/resume-guide' // Replace with actual URL
    },
    {
      'title': 'Interview Preparation',
      'description': 'Get tips and tricks for successful interviews.',
      'url': 'https://www.example.com/interview-prep' // Replace with actual URL
    },
    {
      'title': 'Networking Tips',
      'description': 'Learn how to network effectively in your industry.',
      'url': 'https://www.example.com/networking-tips' // Replace with actual URL
    },
    {
      'title': 'Professional Development',
      'description': 'Find courses and workshops to enhance your skills.',
      'url': 'https://www.example.com/professional-development' // Replace with actual URL
    },
  ];

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Resources'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(resources[index]['title']!),
              subtitle: Text(resources[index]['description']!),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _launchURL(resources[index]['url']!),
            ),
          );
        },
      ),
    );
  }
}
