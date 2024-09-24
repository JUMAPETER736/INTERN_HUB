
import 'package:flutter/material.dart';

class InstitutionDashBard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Institutions Dashboard'),
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
                'Institution Menu',
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
                // Navigate to Home
                Navigator.pushReplacementNamed(context, '/Home');
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('Manage Internships'),
              onTap: () {
                // Navigate to Manage Internships page
                Navigator.pushReplacementNamed(context, '/ManageInternships');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile Settings'),
              onTap: () {
                // Navigate to Profile Settings page
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
              'Welcome to the Institutions Dashboard!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  _buildDashboardCard(
                    context,
                    Icons.assignment,
                    'View Internships',
                    '/ViewInternships',
                  ),
                  _buildDashboardCard(
                    context,
                    Icons.receipt,
                    'Manage Applications',
                    '/ManageApplications',
                  ),
                  _buildDashboardCard(
                    context,
                    Icons.notifications,
                    'Notifications',
                    '/Notifications',
                  ),
                  _buildDashboardCard(
                    context,
                    Icons.help,
                    'Help & Support',
                    '/HelpSupport',
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
