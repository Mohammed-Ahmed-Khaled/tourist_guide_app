import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_guide_app/generated/l10n.dart';
import 'package:tourist_guide_app/models/governments_model.dart';
import 'package:tourist_guide_app/providers/favorites_provider.dart';

class PlaceCard extends ConsumerWidget {
  const PlaceCard({
    super.key,
    required this.government,
  });

  final GovernmentModel government;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<GovernmentModel> favoriteGovernments =
        ref.watch(favoriteGovernmentsProvider);
    final bool isFavorite = favoriteGovernments.contains(government);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                government.imgUrl,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
              government.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteGovernmentsProvider.notifier)
                    .toggleGovernmentFavoriteStatus(government);
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
