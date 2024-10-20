import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _programController = TextEditingController();

  Map<String, dynamic>? userDetails;
  Map<String, dynamic>? companyDetails;
  bool isIntern = false; // Flag to determine if the user is an intern

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    User? user = _auth.currentUser;

    if (user != null) {
      try {
        // Determine if the user is an intern or company based on their email format
        if (user.email!.contains('@unima.ac.mw')) {
          // Interns assumed to have a specific email format
          isIntern = true;
          DocumentSnapshot snapshot = await _firestore
              .collection('Intern_Personal_Details')
              .doc(user.email)
              .get();

          if (snapshot.exists) {
            setState(() {
              userDetails = snapshot.data() as Map<String, dynamic>?;

              _phoneController.text = userDetails!['phone'] ?? '';
              _universityController.text = userDetails!['university'] ?? '';
              _programController.text = userDetails!['course'] ?? '';
            });
          } else {
            setState(() {
              userDetails = null;
            });
            print('Intern document not found for Email: ${user.email}');
          }
        } else {
          // Fetch company details if it's a company
          DocumentSnapshot snapshot = await _firestore
              .collection('Company_Details')
              .doc(user.email)
              .get();

          if (snapshot.exists) {
            setState(() {
              companyDetails = snapshot.data() as Map<String, dynamic>?;
            });
          } else {
            setState(() {
              companyDetails = null;
            });
            print('Company document not found for Email: ${user.email}');
          }
        }
      } catch (e) {
        print('Error fetching user details: $e');
      }
    }
  }

  Future<void> _updateUserDetails() async {
    User? user = _auth.currentUser;

    if (user != null && isIntern) {
      try {
        await _firestore.collection('Intern_Personal_Details').doc(user.email).update({
          'phone': _phoneController.text,
          'university': _universityController.text,
          'course': _programController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated Successfully!')),
        );
      } catch (e) {
        print('Error updating user details: $e');
      }
    }
  }

  void _navigateToChangePassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChangePasswordPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: isIntern ? _buildInternProfile() : _buildCompanyProfile(),
      ),
    );
  }

  Widget _buildInternProfile() {
    return userDetails == null
        ? Center(child: CircularProgressIndicator())
        : Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _buildProfileField('Name', userDetails!['name']),
          _buildProfileField('Email', userDetails!['email']),
          _buildEditableField('Phone', _phoneController),
          _buildEditableField('University', _universityController),
          _buildEditableField('Program', _programController),
          SizedBox(height: 20),
          _buildStyledButton('Save Changes', _updateUserDetails),
          SizedBox(height: 10),
          _buildStyledButton('Change Password', _navigateToChangePassword),
        ],
      ),
    );
  }

  Widget _buildCompanyProfile() {
    if (companyDetails == null) {
      return Center(child: Text('No Company details found.'));
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _buildProfileField('Company Name', companyDetails!['companyName']),
          _buildProfileField('Email', companyDetails!['email']),
          _buildProfileField('Address', companyDetails!['companyAddress']),

          SizedBox(height: 20),
          _buildStyledButton('Change Password', _navigateToChangePassword),
        ],
      ),
    );
  }

  Widget _buildStyledButton(String title, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.teal,
        padding: EdgeInsets.symmetric(vertical: 15.0),
        textStyle: TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(title),
    );
  }

  Widget _buildProfileField(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  value ?? 'N/A',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String title, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: title,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                  ),
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  Future<void> _changePassword() async {
    User? user = _auth.currentUser;

    if (user != null) {
      String oldPassword = _oldPasswordController.text;
      String newPassword = _newPasswordController.text;
      String confirmPassword = _confirmPasswordController.text;

      // Validate the passwords
      if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill in all fields.')),
        );
        return;
      }

      if (newPassword == oldPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('New password must be different from Old Password.')),
        );
        return;
      }

      if (newPassword != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('New Passwords do not match.')),
        );
        return;
      }

      try {
        // Reauthenticate the user with the old password
        AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: oldPassword,
        );

        await user.reauthenticateWithCredential(credential);

        // Change the password to the new one
        await user.updatePassword(newPassword);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password updated successfully!')),
        );
        Navigator.pop(context); // Navigate back to the profile screen
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error changing password: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPasswordField('Old Password', _oldPasswordController, obscureText: true),
            SizedBox(height: 20),
            _buildPasswordField('New Password', _newPasswordController, obscureText: !_newPasswordVisible, toggleVisibility: () {
              setState(() {
                _newPasswordVisible = !_newPasswordVisible;
              });
            }),
            SizedBox(height: 20),
            _buildPasswordField('Confirm New Password', _confirmPasswordController, obscureText: !_confirmPasswordVisible, toggleVisibility: () {
              setState(() {
                _confirmPasswordVisible = !_confirmPasswordVisible;
              });
            }),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _changePassword,
              child: Text('Update Password'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller,
      {required bool obscureText, VoidCallback? toggleVisibility}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: toggleVisibility != null
            ? IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: toggleVisibility,
        )
            : null,
      ),
    );
  }
}
