import 'package:flutter/material.dart';

class InternshipDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internship Dashboard'),
        backgroundColor: Colors.purple,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'User Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Home');
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('My Applications'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/MyApplications');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile Settings'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/ProfileSettings');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Welcome to the Internship Dashboard!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  _buildDashboardCard(
                    context,
                    Icons.lightbulb,
                    'Internship Tips', // New Feature
                    '/InternshipTips',
                  ),
                  _buildDashboardCard(
                    context,
                    Icons.people,
                    'Networking Opportunities', // New Feature
                    '/NetworkingOpportunities',
                  ),
                  _buildDashboardCard(
                    context,
                    Icons.business_center,
                    'Career Workshops', // New Feature
                    '/CareerWorkshops',
                  ),
                  _buildDashboardCard(
                    context,
                    Icons.video_library,
                    'Webinars', // New Feature
                    '/Webinars',
                  ),
                  _buildDashboardCard(
                    context,
                    Icons.assignment_ind,
                    'Resume Builder', // New Feature
                    '/ResumeBuilder',
                  ),
                  _buildDashboardCard(
                    context,
                    Icons.question_answer,
                    'Interview Preparation', // New Feature
                    '/InterviewPreparation',
                  ),
                  _buildDashboardCard(
                    context,
                    Icons.local_library,
                    'Resource Library', // New Feature
                    '/ResourceLibrary',
                  ),
                  _buildDashboardCard(
                    context,
                    Icons.timeline,
                    'Internship Timeline', // New Feature
                    '/InternshipTimeline',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, IconData icon, String title, String route) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushReplacementNamed(context, route);
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.purple),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
