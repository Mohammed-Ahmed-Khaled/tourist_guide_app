import 'package:flutter/material.dart';
import 'package:tourist_guide_app/data/governments_data.dart';
import 'package:tourist_guide_app/widgets/place_card.dart';

class PlacesListView extends StatelessWidget {
  const PlacesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: governments.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: PlaceCard(
              government: governments[index],
            ),
          );
        },
      ),
    );
  }
}
