import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseStorage _storage = FirebaseStorage.instance;
final Uuid uuid = Uuid();

Future<void> uploadGameDetails({
  required String title,
  required String description,
  required String apkFilePath, // Local path of the APK file to upload
  required List<String> gameImagesList,
}) async {
  try {
    final User? user = _auth.currentUser;
    if (user == null) {
      throw Exception("User not authenticated");
    }

    // Generate a unique game ID
    final String gameId = uuid.v4();

    // Define storage path
    final storagePath = 'uploads/games/${user.uid}/$gameId.apk';

    // Upload APK file to Firebase Storage
    final fileRef = _storage.ref().child(storagePath);
    final uploadTask = await fileRef.putFile(File(apkFilePath));
    final apkFileUrl = await fileRef.getDownloadURL();

    // Store game details in Firestore
    final gameData = {
      'userid': user.uid,
      'gameid': gameId,
      'title': title,
      'description': description,
      'apkFileUrl': apkFileUrl, // Store download URL in Firestore
      'gameImagesList': gameImagesList,
      'storagePath': storagePath, // Save storage path for easy deletion
    };

    await _firestore
        .collection('games')
        .doc(user.uid)
        .collection('userGames')
        .doc(gameId)
        .set(gameData);

    print("Game details and APK file uploaded successfully!");
  } catch (error) {
    print("Error uploading game details: $error");
  }
}
