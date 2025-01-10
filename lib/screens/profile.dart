import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:tourist_guide_app/screens/editprofile.dart';
import 'package:tourist_guide_app/widgets/listtale_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String fullName = "";
  String email = "";
  String password = "";
  String hashedPassword = "";

  @override
  void initState() {
    super.initState();
    getUserData(); // Load user data from Shared Preferences
  }

  // Function to load user data from Shared Preferences
  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? 'No Name'; // Get full name
      email = prefs.getString('email') ?? ''; // Get email
      password = prefs.getString('password') ?? ""; //get password
      hashedPassword = hashPassword(password); // Hashing password
    });
  }

  // Function to hash password
  String hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Details",
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
        leading: Icon(Icons.person_4_sharp),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            const SizedBox(height: 2),
            CircleAvatar(
              radius: 30,
              backgroundImage: const AssetImage('assets/profile.png'),
            ),
            const SizedBox(height: 8),
            listTileFunc("Full Name", fullName, Icon(Icons.person)),
            const SizedBox(height: 2),
            listTileFunc("Email", email, Icon(Icons.email)),
            const SizedBox(height: 2),
            listTileFunc("Password", hashedPassword, Icon(Icons.password)),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfilePage()),
                  );
                },
                icon: Icon(Icons.edit),
                label: Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 40),
                  padding: EdgeInsets.all(15),
                  backgroundColor: const Color.fromARGB(255, 178, 62, 3),
                  iconColor: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
/*
      //Bottom Navigation Bar Section
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Governments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue, // Active item color
        unselectedItemColor: Colors.grey, // Inactive item color
        type: BottomNavigationBarType.fixed, // Ensure all items are shown
      ),
    );
  }
}
*/
