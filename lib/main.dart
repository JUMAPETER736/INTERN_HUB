import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase core
import 'package:internhub/LogIn_ And_Register/Log_In.dart';
import 'package:internhub/LogIn_ And_Register/Register.dart';
import 'firebase_options.dart';
import 'package:internhub/Home/HomePage.dart';
import 'package:internhub/Home/Vacancies.dart';
import 'package:internhub/Settings/SettingsPage.dart';
import 'package:internhub/Settings/NotificationSettings.dart';
import 'package:internhub/Settings/LanguageSettings.dart';
import 'package:internhub/Settings/ThemeSettings.dart';
import 'package:internhub/Settings/PrivacyPolicy.dart';
import 'package:internhub/Settings/TermsOfService.dart';
import 'package:internhub/Settings/Support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Make sure this is set up
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InternHub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/LogIn', // Set initial route

      routes: {
        '/LogIn': (context) => Log_In(), // Define LogIn route
        '/Register': (context) => Register(), // Define Register route
        '/Home': (context) => HomePage(userRole: ModalRoute.of(context)!.settings.arguments as String), // Pass userRole
        '/NotificationSettings': (context) => NotificationSettings(),
        '/LanguageSettings': (context) => LanguageSettings(),
        '/ThemeSettings': (context) => ThemeSettings(),
        '/PrivacyPolicy': (context) => PrivacyPolicy(),
        '/TermsOfService': (context) => TermsOfService(),
        '/Support': (context) => Support(),
        '/Vacancies': (context) => Vacancies(),


      },
    );
  }
}
