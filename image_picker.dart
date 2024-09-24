import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // To work with File

class ImagePickerExample extends StatefulWidget {
  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File? _image; // To store the selected image
  final picker = ImagePicker(); // ImagePicker instance

  // Method to pick image from gallery
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Method to pick image from camera
  Future<void> _pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image from Camera/Gallery'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Image.file(
                    _image!,
                    width: 200,
                    height: 200,
                  ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              icon: Icon(Icons.photo),
              label: Text('Pick from Gallery'),
              onPressed: _pickImageFromGallery, // Call gallery picker
            ),
            SizedBox(height: 10.0),
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text('Take Photo'),
              onPressed: _pickImageFromCamera, // Call camera picker
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ImagePickerExample(),
  ));
}
