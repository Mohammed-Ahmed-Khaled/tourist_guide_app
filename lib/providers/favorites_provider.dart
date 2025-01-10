import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourist_guide_app/models/governments_model.dart';

class FavoriteGovernmentsNotifier extends StateNotifier<List<GovernmentModel>> {
  FavoriteGovernmentsNotifier() : super([]);
  bool toggleGovernmentFavoriteStatus(GovernmentModel government) {
    final isExisting = state.contains(government);
    if (isExisting) {
      state = state.where((element) => element.id != government.id).toList();
      return false;
    } else {
      state = [...state, government];
      return true;
    }
  }
}

final favoriteGovernmentsProvider =
    StateNotifierProvider<FavoriteGovernmentsNotifier, List<GovernmentModel>>(
        (ref) => FavoriteGovernmentsNotifier());
