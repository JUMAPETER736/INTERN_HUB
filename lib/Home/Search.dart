import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // Map of sections/topics and their sub-items in the InternHub mobile app
  Map<String, List<String>> appFeatures = {
    'Settings': ['Themes', 'Language', 'Notifications', 'Privacy Policy'],
    'Internship Tips': ['Resume Tips', 'Networking Tips', 'Interview Tips'],
    'Interview Preparations': ['Common Questions', 'Dress Code', 'Practice Tips'],
    'Network Operations': ['Connectivity Issues', 'VPN Setup', 'Server Management'],
    'Application Resources': ['Internship Guides', 'Resume Templates'],
    'Upcoming Events': ['Career Fair', 'Internship Webinar'],
    'Saved Internships': [],
    'Featured Internships': [],
    'Post Internship Opportunities': [],
    'Manage Internships': [],
    'View Applications': [],
  };

  // List to hold search results
  List<Map<String, String>> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults = _getAllFeatures(); // Initially show all sections and sub-items
  }

  // Function to retrieve all features and their sub-items as a flat list
  List<Map<String, String>> _getAllFeatures() {
    List<Map<String, String>> allFeatures = [];
    appFeatures.forEach((section, subItems) {
      allFeatures.add({'section': section, 'subItem': ''});
      subItems.forEach((subItem) {
        allFeatures.add({'section': section, 'subItem': subItem});
      });
    });
    return allFeatures;
  }

  // Function to filter sections and sub-items based on search query
  void filterSearchResults(String query) {
    List<Map<String, String>> results = [];
    if (query.isNotEmpty) {
      results = _getAllFeatures().where((feature) {
        String searchText = feature['subItem']!.isEmpty
            ? feature['section']!
            : feature['subItem']!;
        return searchText.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      results = _getAllFeatures();
    }
    setState(() {
      searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search InternHub'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              decoration: InputDecoration(
                hintText: 'Search InternHub...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),

            // Search results
            Expanded(
              child: searchResults.isNotEmpty
                  ? ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  String section = searchResults[index]['section']!;
                  String subItem = searchResults[index]['subItem']!;
                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: subItem.isEmpty ? Text(section) : Text('$section > $subItem'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle tap on a section or sub-item (navigate to details, etc.)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(subItem.isEmpty
                                ? '$section tapped!'
                                : '$subItem under $section tapped!'),
                          ),
                        );
                      },
                    ),
                  );
                },
              )
                  : Center(
                child: Text('No results found', style: TextStyle(fontSize: 16.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Search(),
  ));
}
