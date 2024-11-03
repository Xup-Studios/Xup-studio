import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xupstore/consts/themes.dart';
import 'package:xupstore/views/Developer/payment_method.dart';
import 'dart:io';

import '../../consts/forward_buttons.dart';

class DevProfile extends StatefulWidget {
  @override
  _DevProfileState createState() => _DevProfileState();
}

class _DevProfileState extends State<DevProfile> {
  final ImagePicker _picker = ImagePicker();
  File? _logoImage; // For the logo (avatar)
  File? _cnicImage; // For the CNIC upload

  // Function to pick an image for the logo
  Future<void> _pickLogoImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _logoImage = File(image.path);
      });
    }
  }

  // Function to pick an image for the CNIC
  Future<void> _pickCnicImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _cnicImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50), // Top padding
            Text(
              'Developer Profile', // Page title
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 20),
            // Avatar (Logo)
            GestureDetector(
              onTap: _pickLogoImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _logoImage != null
                    ? FileImage(_logoImage!)
                    : AssetImage('assets/avatar_placeholder.png') as ImageProvider,
              ),
            ),
            SizedBox(height: 20),
            // Information Containers
            _buildLabeledTextBox('Name', 'Enter your full name'),
            _buildLabeledTextBox('Store Name', 'Enter your store name'),
            _buildLabeledTextBox('Email', 'Enter your email'),
            _buildLabeledTextBox('NIC', 'Enter your NIC'),
            _buildLabeledTextBox('Contact', 'Enter your contact number'),
            SizedBox(height: 20),
            // CNIC Upload Box
            GestureDetector(
              onTap: _pickCnicImage,
              child: Container(
                alignment: Alignment.center,
                width: 250,
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    _cnicImage != null
                        ? Image.file(_cnicImage!) // Display CNIC image if selected
                        : Column(
                      children: [
                        Icon(Icons.image, size: 50, color: Colors.white),
                        SizedBox(height: 10),
                        Text(
                          'Upload NIC Image',
                          style: TextStyle(color: Colors.white,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Next Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
              text: 'Next',
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentDetailsPage(),
                    ));// Implement next button action here
              },
                              ),
              ),

            SizedBox(height: 30), // Bottom padding
          ],
        ),
      ),
    );
  }

  // Helper function to build labeled text boxes
  Widget _buildLabeledTextBox(String label, String placeholder) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyle(color: Colors.grey[500],fontSize: 12),
              filled: true,
              fillColor: textboxcolor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
