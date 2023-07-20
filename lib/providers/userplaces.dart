import 'package:favorite_places_app/model/favplacesmodel.dart';
import 'package:riverpod/riverpod.dart';
import 'dart:io';

class UserPlacesNotifier extends StateNotifier<List<FavPlacesModel>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title, File image) {
    final newPlace = FavPlacesModel(title: title, image: image);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<FavPlacesModel>>(
        (ref) => UserPlacesNotifier());
