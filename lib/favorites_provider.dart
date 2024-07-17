import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  List<int> _favoriteItems = [];

  List<int> get favoriteItems => _favoriteItems;

  void toggleFavorite(int itemId) async {
    if (_favoriteItems.contains(itemId)) {
      _favoriteItems.remove(itemId);
    } else {
      _favoriteItems.add(itemId);
    }
    notifyListeners();
    await _saveToPreferences();
  }

  Future<void> _saveToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', _favoriteItems.map((e) => e.toString()).toList());
  }

  Future<void> loadFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _favoriteItems = prefs.getStringList('favorites')?.map((e) => int.parse(e)).toList() ?? [];
    notifyListeners();
  }
}
