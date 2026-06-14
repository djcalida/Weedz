import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/product.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Product> _favorites = [];

  List<Product> get favorites => [..._favorites];

  bool isFavorite(String productId) {
    return _favorites.any((product) => product.id == productId);
  }

  int get favoriteCount => _favorites.length;

  Future<void> toggleFavorite(Product product) async {
    final index = _favorites.indexWhere((p) => p.id == product.id);
    
    if (index >= 0) {
      // Remove from favorites
      _favorites.removeAt(index);
    } else {
      // Add to favorites
      _favorites.add(product);
    }
    
    notifyListeners();
    await _saveFavorites();
  }

  Future<void> _saveFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesJson = _favorites.map((p) => p.toJson()).toList();
      await prefs.setString('favorites', json.encode(favoritesJson));
    } catch (e) {
      debugPrint('Error saving favorites: $e');
    }
  }

  Future<void> loadFavorites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favoritesString = prefs.getString('favorites');
      
      if (favoritesString != null) {
        final List<dynamic> favoritesJson = json.decode(favoritesString);
        _favorites.clear();
        _favorites.addAll(
          favoritesJson.map((json) => Product.fromJson(json)).toList(),
        );
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading favorites: $e');
    }
  }

  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
    _saveFavorites();
  }
}
