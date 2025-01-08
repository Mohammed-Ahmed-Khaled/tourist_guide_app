import 'package:flutter/material.dart';
import 'package:tourist_guide_app/data/data.dart';
import 'package:tourist_guide_app/widgets/place_card.dart';

class PlacesGridView extends StatelessWidget {
  const PlacesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.9,
        ),
        itemCount: suggestedplaces.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: PlaceCard(
              place: suggestedplaces[index],
            ),
          );
        },
      ),
    );
  }
}
