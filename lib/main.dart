import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart'; // Import login page

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter widgets are initialized
  await Firebase
      .initializeApp(); // Ensure Firebase is initialized before running the app

  runApp(MyApp()); // Run the app
}

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      title: 'SnapRecipe',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set primary color theme
      ),
      home: RecipePage(), // Use RecipePage as the home screen
    );
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnapRecipe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/landing', // Set the initial route to landing page
      routes: {
        '/landing': (context) => LandingPage(), // Define the landing page route
        '/login': (context) => LoginScreen(), // Define the login page route
        '/image_capture': (context) =>
            ImageCaptureScreen(), // Define the image capture page route
      },
    );
  }
}
