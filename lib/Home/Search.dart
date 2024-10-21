import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // List of sections/topics in the InternHub mobile app
  List<String> appFeatures = [
    'Settings',
    'Internship Tips',
    'Interview Preparations',
    'Network Operations',
    'Application Resources',
    'Upcoming Events',
    'Saved Internships',
    'Featured Internships',
    'Post Internship Opportunities',
    'Manage Internships',
    'View Applications',
  ];

  // List to hold search results
  List<String> searchResults = [];

  @override
  void initState() {
    super.initState();
    searchResults = appFeatures; // Initially show all sections
  }

  // Function to filter sections/topics based on search query
  void filterSearchResults(String query) {
    List<String> results = [];
    if (query.isNotEmpty) {
      results = appFeatures
          .where((feature) => feature.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      results = appFeatures;
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
                  return Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text(searchResults[index]),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Handle tap on a section (navigate to details, etc.)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${searchResults[index]} tapped!'),
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
