import 'package:flutter/material.dart';
import '../generated/l10n.dart';
import '../models/place_model.dart';
import '../widgets/place_card.dart';
import '../widgets/translate.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
    required this.places,
    required this.togglelanguage,
  });

  final List<PlaceModel> places;
  final void Function() togglelanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favorites),
        centerTitle: true,
        actions: [
          TranslateButton(togglelanguage: togglelanguage),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: places.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: PlaceCard(
              place: places[index],
            ),
          );
        },
      ),
    );
  }
}
