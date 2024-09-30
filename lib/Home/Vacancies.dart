import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(InternHubApp());
}

class InternHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InternHub',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Vacancies(),
        '/VacancyDetails': (context) => VacancyDetailsPage(),
      },
    );
  }
}

class Vacancies extends StatelessWidget {
  final List<String> vacancies = [
    "Research Assistants (15) – WASH Projects Sustainability Research"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Released Vacancies'),
        backgroundColor: Colors.redAccent,
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Vacancies',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: vacancies.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 6,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      title: Text(
                        vacancies[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text('Click to view details'),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.redAccent,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/VacancyDetails');
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Useful Links',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.redAccent,
              ),
            ),
            ListTile(
              title: Text('LinkedIn: Liberty Affiliates'),
              trailing: Icon(Icons.open_in_new),
              onTap: () => _launchURL('https://www.linkedin.com/company/lvm-documents-editors-data-entry-servces/'),
            ),
            ListTile(
              title: Text('Fuel Station Supervisor Job Posting'),
              trailing: Icon(Icons.open_in_new),
              onTap: () => _launchURL('https://jobsearchmalawi.com/job/fuel-station-supervisor-2/#google_vignette'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class VacancyDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vacancy Details'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Research Assistants (15) – WASH Projects Sustainability Research',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Organization: Liberty Affiliates\n'
                    'Location: Songani Trading Centre, Zomba\n'
                    'Duration: Short-term Contract (Project-Based)\n'
                    'Application Deadline: 4 October, 2024\n',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Key Responsibilities:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              Text(
                '• Conduct data collection in Songani Trading Centre, including household surveys and community interviews.\n'
                    '• Assist with the organization and management of field data, ensuring accuracy and completeness.\n'
                    '• Engage with community members to gather qualitative and quantitative information on the sustainability of WASH projects.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle application submission
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Apply Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
