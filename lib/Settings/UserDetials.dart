

import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Text('User Profile Page'),
      ),
    );
  }
}
