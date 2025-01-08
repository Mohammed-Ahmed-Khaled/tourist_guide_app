import 'package:flutter/material.dart';
import 'package:tourist_guide_app/models/place_model.dart';

class PlaceCard extends StatefulWidget {
  const PlaceCard({
    super.key,
    required this.place,
  });

  final PlaceModel place;

  @override
  State<PlaceCard> createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                widget.place.imageUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              widget.place.title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.place.government,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ), /*
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(wasAdded
                        ? 'Added to Favorites'
                        : 'Removed from Favorites'),
                  ),
                );
              },
              icon: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: Tween<double>(
                      begin: 0.8,
                      end: 1.0,
                    ).animate(animation),
                    child: child,
                  );
                },
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.teal,
                  key: ValueKey(isFavorite),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
