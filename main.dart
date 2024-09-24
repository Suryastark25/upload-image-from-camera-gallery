import 'package:flutter/material.dart';
import 'screens/image_picker_example.dart'; // Import the ImagePickerExample screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImagePickerExample(), // Set the ImagePickerExample as the home screen
    );
  }
}
