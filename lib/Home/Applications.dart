import 'package:flutter/material.dart';

class Application {
  final String internshipTitle;
  final String company;
  final String status;
  final String submissionDate;

  Application({
    required this.internshipTitle,
    required this.company,
    required this.status,
    required this.submissionDate,
  });
}

class Applications extends StatelessWidget {
  // Sample list of applications
  final List<Application> applications = [
    Application(
      internshipTitle: 'Software Engineering Intern',
      company: 'Tech Solutions',
      status: 'Applied',
      submissionDate: '2024-09-01',
    ),
    Application(
      internshipTitle: 'Marketing Intern',
      company: 'Creative Agency',
      status: 'Interview Scheduled',
      submissionDate: '2024-09-10',
    ),
    Application(
      internshipTitle: 'Data Analyst Intern',
      company: 'Data Corp',
      status: 'Rejected',
      submissionDate: '2024-09-15',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Applications'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.grey[100], // Subtle background color
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search Applications',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: applications.length,
                itemBuilder: (context, index) {
                  final application = applications[index];
                  return _buildApplicationCard(application);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApplicationCard(Application application) {
    return Card(
      elevation: 5, // Shadow effect
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(15), // Padding inside the card
        title: Text(
          application.internshipTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.teal,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5), // Space between title and subtitle
            Text(
              'Company: ${application.company}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  application.status == 'Applied'
                      ? Icons.access_time
                      : application.status == 'Interview Scheduled'
                      ? Icons.check_circle
                      : Icons.cancel,
                  color: application.status == 'Applied'
                      ? Colors.orange
                      : application.status == 'Interview Scheduled'
                      ? Colors.green
                      : Colors.red,
                ),
                SizedBox(width: 5), // Space between icon and text
                Text(
                  'Status: ${application.status}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'Submitted on: ${application.submissionDate}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            // Navigate to application details or perform an action
          },
        ),
      ),
    );
  }
}
