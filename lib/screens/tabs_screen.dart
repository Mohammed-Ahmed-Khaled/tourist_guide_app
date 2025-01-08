import 'package:flutter/material.dart';
import 'package:tourist_guide_app/screens/favorites_screen.dart';
import 'package:tourist_guide_app/screens/places_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  Widget activeScreen = PlacesScreen();

  Widget activePage() {
    if (selectedPageIndex == 0) {
      activeScreen = PlacesScreen();
    } else if (selectedPageIndex == 1) {
      activeScreen = FavoritesScreen();
    } else if (selectedPageIndex == 2) {
      activeScreen = FavoritesScreen();
    } else {
      activeScreen = FavoritesScreen();
    }
    return activeScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: activePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.black,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        onTap: (index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: 'Governments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
