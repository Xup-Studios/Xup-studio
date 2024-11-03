import 'package:flutter/material.dart';
import 'package:xupstore/consts/forward_buttons.dart';

import '../../consts/themes.dart';

class PaymentDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Light brown background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Page Title
                Center(
                  child: Text(
                    'Your Account Details ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 120),
            
                // Payment Method Label
                Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
            
                // Payment Method Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
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
                  ),
                  hint: Text('Select method',style:TextStyle(color: Colors.grey[500],fontSize: 12) ),
                  items: ['Bank Account', 'Easy Paisa', 'Jazz Cash']
                      .map((method) => DropdownMenuItem(
                    value: method,
                    child: Text(method),
                  ))
                      .toList(),
                  onChanged: (value) {
                    // Handle method selection
                  },
                ),
                SizedBox(height: 20),
            
                // Bank Name Dropdown
                Text(
                  'Bank Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
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
                  ),
                  hint: Text('Select Bank',style:TextStyle(color: Colors.grey[500],fontSize: 12) ,),
                  items: ['Bank A', 'Bank B', 'Bank C']
                      .map((bank) => DropdownMenuItem(
                    value: bank,
                    child: Text(bank),
                  ))
                      .toList(),
                  onChanged: (value) {
                    // Handle bank selection
                  },
                ),
                SizedBox(height: 20),
            
                // Account Title
                Text(
                  'Account Title',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Account Title .',
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
                  ),
                ),
                SizedBox(height: 20),
            
                // Account No
                Text(
                  'Account No.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Account No.',
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
                  ),
                ),
                SizedBox(height: 30),
            
                // Next Button
                Center(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
