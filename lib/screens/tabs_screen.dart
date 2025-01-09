import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../generated/l10n.dart';
import '../models/place_model.dart';
import '../providers/favorites_provider.dart';
import '../providers/nav_bar_provider.dart';
import '../screens/favorites_screen.dart';
import '../screens/places_screen.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen(this.togglelanguage, {super.key});

  final void Function() togglelanguage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedPageIndex = ref.watch(navBarProvider);
    Widget activeScreen = PlacesScreen(
      togglelanguage: togglelanguage,
    );
    Widget activePage() {
      if (selectedPageIndex == 0) {
        activeScreen = PlacesScreen(
          togglelanguage: togglelanguage,
        );
      } else if (selectedPageIndex == 1) {
        final List<PlaceModel> favoritePlaces =
            ref.watch(favoritePlacesProvider);
        activeScreen = FavoritesScreen(
          places: favoritePlaces,
          togglelanguage: togglelanguage,
        );
      } else if (selectedPageIndex == 2) {
        activeScreen = PlacesScreen(
          togglelanguage: togglelanguage,
        );
      } else {
        activeScreen = PlacesScreen(
          togglelanguage: togglelanguage,
        );
      }
      return activeScreen;
    }

    return Scaffold(
      body: activePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.black,
        selectedFontSize: 15,
        unselectedFontSize: 10,
        onTap: ref.read(navBarProvider.notifier).selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: S.of(context).favorites,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_city),
            label: S.of(context).governments,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: S.of(context).profile,
          ),
        ],
      ),
    );
  }
}
