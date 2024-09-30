import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For handling external links

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Vacancies',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: vacancies.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        vacancies[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Click to view details'),
                      trailing: Icon(Icons.chevron_right),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Research Assistants (15) – WASH Projects Sustainability Research',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Organization: Liberty Affiliates\n'
                    'Location: Songani Trading Centre, Zomba\n'
                    'Duration: Short-term Contract (Project-Based)\n'
                    'Application Deadline: 4 October, 2024\n',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'About Liberty Affiliates:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Liberty Affiliates is a leading entity dedicated to improving community well-being through impactful research and sustainable development projects. We are currently conducting a research study to assess the impacts of Water, Sanitation, and Hygiene (WASH) project sustainability in Songani Trading Centre, Zomba.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Position Overview:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'We are seeking 15 motivated and detail-oriented Research Assistants to join our team. The successful candidates will play a key role in data collection and analysis for the WASH project sustainability research. This is an excellent opportunity for individuals interested in fieldwork, data analysis, and contributing to meaningful development projects.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Key Responsibilities:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '• Conduct data collection in Songani Trading Centre, including household surveys and community interviews.\n'
                    '• Assist with the organization and management of field data, ensuring accuracy and completeness.\n'
                    '• Engage with community members to gather qualitative and quantitative information on the sustainability of WASH projects.\n'
                    '• Support data entry, cleaning, and preliminary analysis under the guidance of the lead researcher.\n'
                    '• Participate in field visits and contribute to report writing and presentation of findings.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Requirements:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '• A degree (or currently pursuing one) in Social Sciences, Development Studies, Environmental Studies, or related fields.\n'
                    '• Experience in research, data collection, or working with WASH projects will be an added advantage.\n'
                    '• Strong interpersonal and communication skills for community engagement.\n'
                    '• Ability to work independently and as part of a team.\n'
                    '• Familiarity with data collection tools such as KoBo Toolbox or ODK is a plus.\n'
                    '• Willingness to work in the field under flexible conditions.\n'
                    '• Those that attended any of our trainings are encouraged to apply.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'What We Offer:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '• Opportunity to gain hands-on experience in research and project evaluation.\n'
                    '• Contribution to a high-impact study on the sustainability of WASH projects.\n'
                    '• Competitive allowance during the project period.\n'
                    '• A supportive and collaborative working environment.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'How to Apply:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Interested candidates should send their CV and a brief cover letter detailing their suitability for the role to libertyaffiliatesmw@gmail.com with the subject line “Research Assistant Application – WASH Projects Study” by 4 October, 2024.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Liberty Affiliates is an equal opportunity employer. We encourage applications from candidates of all backgrounds.\nJoin us in shaping sustainable solutions for community development!',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
