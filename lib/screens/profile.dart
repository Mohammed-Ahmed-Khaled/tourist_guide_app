import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:tourist_guide_app/screens/editprofile.dart';
import 'package:tourist_guide_app/widgets/listtale_widget.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Profile(), // Set Profile as the home
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Function to hash the phone number
  String _hashPhoneNumber(String phoneNumber) {
    // Convert the phone number to bytes and apply SHA-256 hashing
    final bytes = utf8.encode(phoneNumber);
    final digest = sha256.convert(bytes);
    return digest.toString(); // Return the hashed phone number as a string
  }

  @override
  Widget build(BuildContext context) {
    // Original phone number
    final String phoneNumber = "+1234567890";
    final String hashedPhoneNumber = _hashPhoneNumber(phoneNumber);
    int _currentIndex = 3;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'), // AppBar title
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          padding: const EdgeInsets.all(
              16.0), // Add padding around the profile content
          child: Column(children: [
            const SizedBox(height: 2), // Space from the top
            CircleAvatar(
              radius: 30,
              backgroundImage: const AssetImage(
                  'assets/profile.png'), // Ensure this image exists
            ),
            const SizedBox(height: 8), // Space below the profile avatar
            listTileFunc("Full Name", "Ahmad Mahmoud", Icon(Icons.person)),
            const SizedBox(height: 2), // Space between ListTale
            listTileFunc("Email", "Ahmad@test.com", Icon(Icons.email)),
            const SizedBox(height: 2), // Space between ListTale
            listTileFunc("Password", hashedPhoneNumber, Icon(Icons.password)),
            //Elavated Button
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ElevatedButton.icon(
                  onPressed: () {
                    //navigate to a page similar to sign up page ?
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditProfilePage()),
                    );
                  },
                  icon: Icon(Icons.edit), // Set button icon
                  label: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.black),
                  ), // Set button text
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 40),
                      padding: EdgeInsets.all(15),
                      backgroundColor: const Color.fromARGB(255, 176, 65, 246),
                      iconColor: const Color.fromARGB(255, 242, 145, 1))),
            )
          ]),
        ),
      ),
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
