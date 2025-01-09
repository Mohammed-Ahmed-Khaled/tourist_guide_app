import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_guide_app/generated/l10n.dart';
import 'package:tourist_guide_app/models/place_model.dart';
import 'package:tourist_guide_app/providers/favorites_provider.dart';

class PlaceCard extends ConsumerWidget {
  const PlaceCard({
    super.key,
    required this.place,
  });

  final PlaceModel place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PlaceModel> favoritePlaces = ref.watch(favoritePlacesProvider);
    final bool isFavorite = favoritePlaces.contains(place);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                place.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              place.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              place.government,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoritePlacesProvider.notifier)
                    .togglePlaceFavoriteStatus(place);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? S.of(context).addedToFavorites
                        : S.of(context).removedFromFavorites),
                  ),
                );
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.teal,
                key: ValueKey(isFavorite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
