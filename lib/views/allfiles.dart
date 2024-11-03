import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FilesList extends StatelessWidget {
  const FilesList({super.key});

  Future<void> downloadFile(String url, BuildContext context) async {
    try {
      // Get the downloads directory
      Directory? directory = await getExternalStorageDirectory();
      String filePath =
          '${directory!.path}/downloaded_image.jpg'; // Change the file name as needed

      // Use Dio to download the file
      await Dio().download(url, filePath);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Download Complete'),
            content: Text('File downloaded to: $filePath'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Error downloading file: $e'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            "Files",
            style: GoogleFonts.poppins(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('files').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            var apps = snapshot.data?.docs;
            return ListView.builder(
              itemCount: apps?.length,
              itemBuilder: (context, index) {
                var app = apps?[index];
                DateTime guessedAtDateTime = app!['uploadDate'] != null
                    ? (app['uploadDate'] as Timestamp).toDate()
                    : DateTime.now();

                // Format the DateTime using intl package
                String formattedDate =
                    DateFormat('yy-MM-dd').format(guessedAtDateTime);
                return ListTile(
                  title: Text(app['fileName']),
                  subtitle: Text(formattedDate, style: GoogleFonts.poppins()),
                  trailing: IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () => downloadFile(app['downloadURL'], context),
                  ),
                );
              },
            );
          },
        ));
  }
}
