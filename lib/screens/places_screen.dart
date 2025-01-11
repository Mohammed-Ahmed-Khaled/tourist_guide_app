import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import '../widgets/places_grid_view.dart';
import '../widgets/places_list_view.dart';
import '../widgets/translate.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key, required this.togglelanguage});

  final void Function() togglelanguage;

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
            title: Text(S.of(context).places),
            actions: [
              TranslateButton(togglelanguage: widget.togglelanguage),
            ],
            bottom: TabBar(
              labelColor: Color(0XFF50B3C8),
              unselectedLabelColor: Colors.black,
              indicatorColor: Color(0XFF50B3C8),
              tabs: [
                Tab(
                  text: S.of(context).suggestedPlaces,
                ),
                Tab(
                  text: S.of(context).popularPlaces,
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
