import 'package:flutter/material.dart';
import 'package:tourist_guide_app/widgets/places_grid_view.dart';
import 'package:tourist_guide_app/widgets/places_list_view.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  List<Widget> tabs = [
    const PlacesGridView(),
    const PlacesListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Places'),
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: const [
                Tab(
                  text: 'Suggested Places',
                ),
                Tab(
                  text: 'Popular Places',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: tabs,
          )),
    );
  }
}
