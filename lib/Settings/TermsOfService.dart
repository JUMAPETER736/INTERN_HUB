
import 'package:flutter/material.dart';

class TermsOfService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Service', style: TextStyle(fontSize: 24)),
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
                'Welcome to InternHub',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Please read these terms of service carefully before using our app.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              _buildSection('1. Acceptance of Terms'),
              _buildContent(
                  'By accessing or using the InternHub application, you agree to be bound by these terms. If you do not agree, do not use our services.'
              ),
              _buildSection('2. Modifications to Terms'),
              _buildContent(
                  'We may revise these terms from time to time and will notify you of any changes. Your continued use of the application signifies your acceptance of the new terms.'
              ),
              _buildSection('3. User Responsibilities'),
              _buildContent(
                  'You are responsible for maintaining the confidentiality of your account and password. You agree to notify us immediately of any unauthorized use of your account.'
              ),
              _buildSection('4. Limitation of Liability'),
              _buildContent(
                  'In no event shall InternHub or its affiliates be liable for any indirect, incidental, or consequential damages arising from your use of the application.'
              ),
              _buildSection('5. Governing Law'),
              _buildContent(
                  'These terms shall be governed by the laws of the jurisdiction where InternHub operates.'
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Implement functionality for accepting terms here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Terms accepted!')),
                  );
                },
                child: Text('Accept Terms'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildContent(String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
