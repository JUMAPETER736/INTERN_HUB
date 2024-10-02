import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:internhub/Settings/UserDetails.dart';
import 'package:internhub/Home/Applications.dart';
import 'package:internhub/Home/Vacancies.dart';
import 'package:internhub/Home/Help.dart';
import 'package:internhub/Home/InstitutionDashBoard.dart';
import 'package:internhub/Home/ApplicationResources.dart';
import 'package:internhub/Home/Search.dart';
import 'package:internhub/Settings/SettingsPage.dart';
import 'package:internhub/LogIn_ And_Register/Log_In.dart'; // Import the LoginPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  int _selectedIndex = 1; // To track the selected item in bottom navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, // Updated background color
      appBar: AppBar(
        title: Text(
          'InternHub',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white, size: 28),
            onPressed: () {
              // Navigate to search page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white, size: 28),
            onPressed: _logout, // Call the logout function
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 16,
                childAspectRatio: 5.3 / 3,
                children: [
                  // Profile Section
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetails(),
                        ),
                      );
                    },
                    child: _buildSquareCard(
                      icon: Icons.person,
                      text: 'Your Profile',
                      color: Colors.blueAccent, // Updated color
                    ),
                  ),
                  // Internship Applications Section
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Applications(),
                        ),
                      );
                    },
                    child: _buildSquareCard(
                      icon: Icons.work_outline,
                      text: 'My Applications',
                      color: Colors.deepOrange, // Updated color
                    ),
                  ),
                  // Employer Section
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Vacancies(),
                        ),
                      );
                    },
                    child: _buildSquareCard(
                      icon: Icons.business_center,
                      text: 'Vacancies',
                      color: Colors.redAccent, // Updated color
                    ),
                  ),
                  // Employer Dashboard Section
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InstitutionDashBard(),
                        ),
                      );
                    },
                    child: _buildSquareCard(
                      icon: Icons.school,
                      text: 'Employer Dashboard', // Renamed
                      color: Colors.purpleAccent, // Updated color
                    ),
                  ),
                  // Application Resources Section
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApplicationResources(),
                        ),
                      );
                    },
                    child: _buildSquareCard(
                      icon: Icons.library_books,
                      text: 'Application Resources', // Renamed
                      color: Colors.tealAccent, // Updated color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.help, size: 28),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 28),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  // Method to handle navigation on bottom navigation tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Help()),
      );
    } else if (index == 1) {
      // Stay on the home page
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SettingsPage()),
      );
    }
  }

  // Method to handle logout functionality
  void _logout() async {
    await _auth.signOut(); // Sign out from Firebase
    // Navigate to login page after logout
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => Log_In()),
          (Route<dynamic> route) => false, // Removes all previous routes
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logged out Successfully!')),
    );
  }

  // Method to build a square card
  Widget _buildSquareCard(
      {required IconData icon, required String text, required Color color}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: color,
          ),
          SizedBox(height: 10),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
