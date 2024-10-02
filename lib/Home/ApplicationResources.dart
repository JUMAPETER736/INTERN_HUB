import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicationResources extends StatelessWidget {
  final List<Map<String, dynamic>> resources = [

    {
      'title': 'Resume Building Guide',
      'description': 'Learn how to build an effective resume.',
      'type': 'navigate',
    },
    {
      'title': 'Interview Preparation',
      'description': 'Get tips and tricks for successful interviews.',
      'type': 'navigate',
    },
    {
      'title': 'Networking Tips',
      'description': 'Learn how to network effectively in your industry.',
      'type': 'navigate',
    },
    {
      'title': 'Professional Development',
      'description': 'Find courses and workshops to enhance your skills.',
      'type': 'navigate',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Resources'),
        backgroundColor: Colors.teal[900],
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
        onTap: () {
          switch (resources[index]['title']) {

            case 'Resume Building Guide':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResumeBuildingGuidePage(),
                ),
              );
              break;
            case 'Interview Preparation':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InterviewPreparationPage(),
                ),
              );
              break;
            case 'Networking Tips':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NetworkingTipsPage(),
                ),
              );
              break;
            case 'Professional Development':
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfessionalDevelopmentPage(),
                ),
              );
              break;
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.library_books, size: 40, color: Colors.teal[700]),
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
                        color: Colors.teal[800],
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
              Icon(Icons.arrow_forward, color: Colors.teal[700]),
            ],
          ),
        ),
      ),
    );
  }
}

// Page for Internship Opportunities
class InternshipOpportunitiesPage extends StatelessWidget {
  final List<Map<String, String>> internships = [
    {
      'title': 'Software Engineering Internship',
      'company': 'Tech Solutions',
      'description': 'Join our team to work on exciting software projects and develop your coding skills.',
      'link': 'https://www.example.com/software-internship',
    },
    {
      'title': 'Marketing Internship',
      'company': 'Creative Agency',
      'description': 'Help us create marketing strategies and gain valuable insights into the industry.',
      'link': 'https://www.example.com/marketing-internship',
    },
    {
      'title': 'Data Analyst Internship',
      'company': 'Data Corp',
      'description': 'Analyze data and contribute to decision-making processes in our company.',
      'link': 'https://www.example.com/data-internship',
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
        title: Text('Internship Opportunities'),
        backgroundColor: Colors.teal[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: internships.length,
          itemBuilder: (context, index) {
            return _buildInternshipCard(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildInternshipCard(BuildContext context, int index) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              internships[index]['title']!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
            SizedBox(height: 5),
            Text(
              internships[index]['company']!,
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 10),
            Text(
              internships[index]['description']!,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _launchURL(internships[index]['link']!);
              },
              child: Text('Apply Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Page for Resume Building Guide
class ResumeBuildingGuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Building Guide'),
        backgroundColor: Colors.teal[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resume Building Tips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Keep it concise: Your resume should ideally be one page long.\n'
                  '2. Tailor your resume: Customize your resume for each job application.\n'
                  '3. Highlight achievements: Focus on your accomplishments, not just duties.\n'
                  '4. Use bullet points: Make it easy to read with bullet points.\n'
                  '5. Proofread: Check for grammar and spelling errors.\n',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                launch('https://www.example.com/resume-guide'); // Replace with actual URL
              },
              child: Text('Learn More'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Page for Interview Preparation
class InterviewPreparationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interview Preparation'),
        backgroundColor: Colors.teal[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Interview Preparation Tips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Research the company: Know its mission and values.\n'
                  '2. Practice common interview questions: Prepare answers for frequently asked questions.\n'
                  '3. Dress appropriately: Wear professional attire suited for the company culture.\n'
                  '4. Follow-up: Send a thank-you email after the interview.\n',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                launch('https://www.example.com/interview-prep'); // Replace with actual URL
              },
              child: Text('Learn More'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Page for Networking Tips
class NetworkingTipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Networking Tips'),
        backgroundColor: Colors.teal[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Networking Tips',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Attend industry events: Participate in conferences and meetups.\n'
                  '2. Utilize LinkedIn: Connect with professionals in your field.\n'
                  '3. Follow-up: Stay in touch with contacts after meeting them.\n'
                  '4. Be genuine: Build relationships based on trust and mutual interest.\n',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                launch('https://www.example.com/networking-tips'); // Replace with actual URL
              },
              child: Text('Learn More'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Page for Professional Development
class ProfessionalDevelopmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Development'),
        backgroundColor: Colors.teal[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Professional Development Resources',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '1. Online Courses: Explore platforms like Coursera, Udemy, and edX.\n'
                  '2. Workshops: Attend workshops relevant to your field.\n'
                  '3. Certifications: Consider certifications to enhance your skills.\n',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                launch('https://www.example.com/professional-development'); // Replace with actual URL
              },
              child: Text('Learn More'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
