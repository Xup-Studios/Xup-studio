import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xupstore/models/games.dart';
import 'package:xupstore/services/firestore_dashboard_services.dart';
import 'package:xupstore/views/Developer/dev_profile.dart';

import 'package:xupstore/views/Developer/uploadGame.dart';
import 'package:xupstore/views/downloadpage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> games = [];
  bool isLoading = true; // Flag to show loading state
  FirestoreDashboardServices firestoreServices = FirestoreDashboardServices();

  @override
  void initState() {
    super.initState();
    // fetchAllGames();
  }

  // Future<void> fetchAllGames() async {

  //   games = await firestoreServices.getAllGames();
  //   setState(() {
  //     isLoading = false; // Update loading state
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff6d72ea),
              ),
              child: Text(
                'XUP Store',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.gamepad),
              title: Text('Upload'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Uploadgame(),
                    ));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Add your onTap logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Be a Developer '),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DevProfile(),
                    ));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xff6d72ea),
        height: 50,
        initialActiveIndex: 1,
        items: [
          TabItem(icon: Icons.home),
          TabItem(icon: Icons.add),
          TabItem(icon: Icons.search),
        ],
        onTap: (int i) => print('click index=$i'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Builder(
                    builder: (context) => IconButton(
                      icon: Icon(Icons.segment, size: 28),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                      radius: 20,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/image.png",
                          fit: BoxFit.cover,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(16),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Game Download Card
              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Color(0xffe0d910),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  clipBehavior:
                      Clip.none, // Allow the icon to overflow the container
                  // alignment:
                  //     Alignment.topCenter, // Aligns the icon at the top center
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical:
                              40), // Adjust vertical padding to accommodate the icon
                      child: Column(
                        children: [
                          // Text Message
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Let's download\na game\nto start",
                              // Center the text
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Game Icon
                    Positioned(
                      top: -140, // Move it up to overlap the container more
                      right: -10, // Adjust the position of the icon
                      child: Container(
                        width: 140,
                        height: 350,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/image.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Popular",
                  style: GoogleFonts.nunito(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff262635)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 195, // Fixed height for the horizontal list
                child: StreamBuilder<List<Map<String, dynamic>>>(
                  stream: firestoreServices.getAllGamesStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    // Data is available
                    final games = snapshot.data ?? [];

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: games.length,
                      itemBuilder: (context, index) {
                        final game = games[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DownloadPage(game: game),
                                ),
                              );
                            },
                            child: Container(
                              width: 170, // Fixed width for each item
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 5,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Hero(
                                        tag: 'img-${game['gameid']}',
                                        child: Image.network(
                                          game['gameImagesList'][0],
                                          fit: BoxFit.cover,
                                          height: 120,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            game['title'] ?? 'No Title',
                                            style: GoogleFonts.poppins(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.star,
                                                  color: Color(0xffe0d910)),
                                              Text(
                                                game['rating']?.toString() ??
                                                    '0',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
