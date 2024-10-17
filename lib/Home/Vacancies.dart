import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internhub/Vacancy/VacancyDetails1.dart';
import 'package:internhub/Vacancy/VacancyDetails2.dart';
import 'package:internhub/Vacancy/VacancyDetails3.dart';

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
        '/VacancyDetails1': (context) => VacancyDetails1(),
        '/VacancyDetails2': (context) => VacancyDetails2(),
        '/VacancyDetails3': (context) => VacancyDetails3(),
      },
    );
  }
}

class Vacancies extends StatefulWidget {
  @override
  _VacanciesState createState() => _VacanciesState();
}

class _VacanciesState extends State<Vacancies> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> internships = [];

  @override
  void initState() {
    super.initState();
    _fetchInternships();
  }

  Future<void> _fetchInternships() async {
    try {
      // Fetch internships from Firestore
      QuerySnapshot querySnapshot = await _firestore
          .collection('Internship_Posted')
          .doc('Marketing')
          .collection('Opportunities')
          .get();

      // Map the documents to a list
      List<Map<String, dynamic>> fetchedInternships = querySnapshot.docs.asMap().map((index, doc) {
        DateTime postingDate = (doc['timestamp'] as Timestamp).toDate(); // Use the timestamp for posting date
        DateTime deadline = postingDate.add(Duration(days: 14)); // Set deadline to 2 weeks after posting date

        return MapEntry(index, {
          'title': doc['title'] ?? 'No Title', // Provide a default value if title is missing
          'description': doc['description'] ?? 'No Description', // Default value for description
          'category': doc['category'] ?? 'No Category', // Default value for category
          'duration': doc['duration'] ?? 'No Duration', // Default value for duration
          'location': doc['location'] ?? 'No Location', // Default value for location
          'requirements': doc['requirements'] ?? 'No Requirements', // Default value for requirements
          'stipend': doc['stipend'] ?? 'No Stipend', // Default value for stipend
          'postingDate': postingDate, // Include the posting date for reference
          'deadline': deadline, // Use calculated deadline directly
          'route': '/VacancyDetails${index + 1}', // Use index + 1 to match detail routes
        });
      }).values.toList();

      // Sort the internships alphabetically by title
      fetchedInternships.sort((a, b) => a['title'].compareTo(b['title']));

      setState(() {
        internships = fetchedInternships; // Update the state
      });
    } catch (e) {
      print('Error fetching internships: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get today's date
    DateTime today = DateTime.now();

    // Filter vacancies to only include those that haven't expired
    final List<Map<String, dynamic>> activeVacancies = internships.where((vacancy) {
      return vacancy["deadline"].isAfter(today);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Released Vacancies'),
        backgroundColor: Colors.redAccent,
        elevation: 5,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red[300]!, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Vacancies',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: activeVacancies.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 8,
                    color: Colors.white,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      title: Text(
                        activeVacancies[index]["title"],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Icon(Icons.info, size: 16, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(
                            'Click to view details',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: Colors.redAccent,
                      ),
                      onTap: () {
                        // Make sure the route exists before navigating
                        String route = activeVacancies[index]["route"];
                        if (route != null && route.isNotEmpty) {
                          Navigator.pushNamed(context, route);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
