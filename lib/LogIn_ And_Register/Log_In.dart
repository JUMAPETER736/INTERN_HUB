import 'package:flutter/material.dart';

class Log_In extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log In',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            // Email Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            // Password Field
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.visibility_off),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30),
            // Log In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle log in
                },
                child: Text('Log In'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Forgot Password
            TextButton(
              onPressed: () {
                // Handle forgot password
              },
              child: Text('Forgot your Password?'),
            ),
            SizedBox(height: 10),
            // Switch to Sign Up
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/Register');
              },
              child: Text('Don\'t have an Account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
