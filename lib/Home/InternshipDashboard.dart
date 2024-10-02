import 'package:flutter/material.dart';

class InternshipDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internship Dashboard'),
        backgroundColor: Colors.deepPurple, // Changed to a deeper shade
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple, // Changed to a deeper shade
              ),
              child: Text(
                'User Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            _buildDrawerItem(context, Icons.home, 'Home', '/Home'),
            _buildDrawerItem(context, Icons.business, 'My Applications', '/MyApplications'),
            _buildDrawerItem(context, Icons.account_circle, 'Profile Settings', '/ProfileSettings'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Internship Dashboard!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.2, // Aspect ratio for better card display
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  _buildDashboardCard(context, Icons.lightbulb, 'Internship Tips', '/InternshipTips'),
                  _buildDashboardCard(context, Icons.people, 'Networking Opportunities', '/NetworkingOpportunities'),
                  _buildDashboardCard(context, Icons.business_center, 'Career Workshops', '/CareerWorkshops'),
                  _buildDashboardCard(context, Icons.video_library, 'Webinars', '/Webinars'),
                  _buildDashboardCard(context, Icons.assignment_ind, 'Resume Builder', '/ResumeBuilder'),
                  _buildDashboardCard(context, Icons.question_answer, 'Interview Preparation', '/InterviewPreparation'),
                  _buildDashboardCard(context, Icons.local_library, 'Resource Library', '/ResourceLibrary'),
                  _buildDashboardCard(context, Icons.timeline, 'Internship Timeline', '/InternshipTimeline'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: TextStyle(color: Colors.deepPurple)),
      onTap: () {
        Navigator.pushReplacementNamed(context, route);
      },
    );
  }

  Widget _buildDashboardCard(BuildContext context, IconData icon, String title, String route) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white, // Set card background color
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
              Icon(icon, size: 40, color: Colors.deepPurple),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
