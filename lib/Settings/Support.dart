import 'package:flutter/material.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frequently Asked Questions',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildSupportTopic('1. How do I reset my password?'),
              _buildSupportTopic('2. How do I contact customer support?'),
              _buildSupportTopic('3. What should I do if I encounter a bug?'),
              _buildSupportTopic('4. How can I provide feedback?'),
              SizedBox(height: 24),
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'If you need further assistance, feel free to reach out to our support team:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              _buildContactInfo('Email: support@internhub.com'),
              _buildContactInfo('Phone: +123 456 7890'),
              _buildContactInfo('Chat: In-app support chat available'),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // Implement functionality for a feedback or support form here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Feedback form coming soon!')),
                  );
                },
                child: Text('Give Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSupportTopic(String topic) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          // Implement navigation or functionality for each topic
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text('$topic selected!')),
          // );
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blueAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blueAccent),
          ),
          child: Text(
            topic,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        info,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
