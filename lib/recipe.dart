import 'dart:convert'; // To encode/decode JSON

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'image_capture.dart'; // Make sure this is the correct path for your image_capture.dart file

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  String? _imageUrl; // URL of the uploaded image
  String? _recipe; // Generated recipe
  bool _isLoading = false; // Loading state
  String _sessionId = ""; // To store the session ID for multiple requests

  // This function will be called once the image is uploaded and the URL is available
  void _handleImageUpload(String imageUrl) {
    setState(() {
      _imageUrl = imageUrl; // Set the image URL
    });
    _generateRecipe(); // Start recipe generation
  }

  // Send the image URL to the backend for recipe generation
  Future<void> _generateRecipe() async {
    if (_imageUrl == null) return;

    setState(() {
      _isLoading = true; // Set loading state to true
    });

    try {
      // Define the payload based on the new input format
      var requestBody = jsonEncode({
        'session_id':
            12345678, // If you have an existing session ID, it will be passed, otherwise, it's empty.
        'image_url':
            _imageUrl, // The image URL obtained after uploading to Firebase
        'prompt': 'Describe the content of the image', // Prompt for the backend
      });

      // Send the URL to your backend
      var response = await http.post(
        Uri.parse(
            'https://django-ai-10.onrender.com/image/'), // Replace with your backend URL
        headers: {'Content-Type': 'application/json'},
        body:
            requestBody, // Include the session ID, image URL, and prompt in the request body
      );

      // Debugging information
      print('Response status: ${response.statusCode}'); // Print response status
      print('Response body: ${response.body}'); // Print response body

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body); // Decode the JSON response

        setState(() {
          _recipe = data['response']; // Use the 'response' key from the backend
          _sessionId =
              data['session_id']; // Update session ID for further requests
        });
      } else {
        print('Error fetching recipe: ${response.statusCode} ${response.body}');
        setState(() {
          _recipe =
              'Failed to generate recipe. Please try again.'; // Display error message
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _recipe =
            'An error occurred. Please try again.'; // Display error message
      });
    } finally {
      setState(() {
        _isLoading = false; // Ensure loading state is set to false
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SnapRecipe')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageCapture(
              onImageUploaded: _handleImageUpload, // Use ImageCapture widget
            ),
            SizedBox(height: 10),
            _isLoading
                ? CircularProgressIndicator() // Show loading indicator
                : _recipe != null
                    ? Text(
                        "Generated Recipe: $_recipe") // Display generated recipe
                    : Text(
                        "Capture an image to generate a recipe"), // Prompt to capture image
          ],
        ),
      ),
    );
  }
}
