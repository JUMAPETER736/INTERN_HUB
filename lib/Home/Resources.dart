import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:internhub/Home/Resources.dart' as resources_page;


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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: resources.length,
          itemBuilder: (context, index) {
            return _buildResourceCard(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildResourceCard(BuildContext context, int index) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => _launchURL(resources[index]['url']!),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.library_books, size: 40, color: Colors.teal),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resources[index]['title']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      resources[index]['description']!,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward, color: Colors.teal),
            ],
          ),
        ),
      ),
    );
  }
}
