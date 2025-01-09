import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_guide_app/models/place_model.dart';

class FavoritePlacesNotifier extends StateNotifier<List<PlaceModel>> {
  FavoritePlacesNotifier() : super([]);
  bool togglePlaceFavoriteStatus(PlaceModel place) {
    final isExisting = state.contains(place);
    if (isExisting) {
      state = state.where((element) => element.id != place.id).toList();
      return false;
    } else {
      state = [...state, place];
      return true;
    }
  }
}

final favoritePlacesProvider =
    StateNotifierProvider<FavoritePlacesNotifier, List<PlaceModel>>(
        (ref) => FavoritePlacesNotifier());
