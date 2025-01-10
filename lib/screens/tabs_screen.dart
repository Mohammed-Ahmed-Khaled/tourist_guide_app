import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_guide_app/generated/l10n.dart';
import 'package:tourist_guide_app/models/governments_model.dart';
import 'package:tourist_guide_app/providers/favorites_provider.dart';
import 'package:tourist_guide_app/providers/nav_bar_provider.dart';
import 'package:tourist_guide_app/screens/favorites_screen.dart';
import 'package:tourist_guide_app/screens/government_screen.dart';
import 'package:tourist_guide_app/screens/places_screen.dart';

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
        final List<GovernmentModel> favoritePlaces =
            ref.watch(favoriteGovernmentsProvider);
        activeScreen = FavoritesScreen(
          governments: favoritePlaces,
          togglelanguage: togglelanguage,
        );
      } else if (selectedPageIndex == 2) {
        activeScreen = GovernmentsScreen(
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
