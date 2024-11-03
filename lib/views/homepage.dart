// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:xupstore/services/firestore_storage.dart';
// import 'package:xupstore/views/allfiles.dart';

// class Homepage extends StatelessWidget {
//   Homepage({super.key});

//   FirestoreStorage _storage = FirestoreStorage();
//   void _onUploadFile() {
//     _storage.uploadFile();
//     print('Upload file clicked');
//     // Add your file upload logic here
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Colors.purple,
//           title: Text(
//             "Xup Store",
//             style: GoogleFonts.poppins(
//                 color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           actions: [
//             IconButton(
//               icon: Padding(
//                 padding: const EdgeInsets.only(right: 10),
//                 child: Icon(
//                   Icons.arrow_forward,
//                   color: Colors.white,
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => FilesList(),
//                     ));
//               },
//             ),
//           ]),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 15,
//           ),
//           Center(
//             child: Text(
//               "Select the files to upload",
//               style: GoogleFonts.poppins(
//                   fontSize: 15, fontWeight: FontWeight.w500),
//             ),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           Center(
//               child: GestureDetector(
//             onTap: _onUploadFile,
//             child: Container(
//               padding: EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: Colors.purple.shade300,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 5,
//                     spreadRadius: 1,
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     Icons.upload_file,
//                     size: 60,
//                     color: Colors.white,
//                   ),
//                   SizedBox(height: 8),
//                   Text(
//                     'Upload File',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ))
//         ],
//       ),
//     );
//   }
// }
