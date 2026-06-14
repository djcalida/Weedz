import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/product.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal => _items.fold(0, (sum, item) => sum + item.total);

  double get shipping => subtotal > 0 ? 15.00 : 0;

  double get tax => subtotal * 0.08;

  double get total => subtotal + shipping + tax;

  void addItem(Product product, {int quantity = 1}) {
    final index = _items.indexWhere((item) => item.product.id == product.id);
    
    if (index != -1) {
      _items[index].quantity += quantity;
    } else {
      _items.add(CartItem(product: product, quantity: quantity));
    }
    
    notifyListeners();
    _saveCart();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
    _saveCart();
  }

  void updateQuantity(String productId, int quantity) {
    if (quantity <= 0) {
      removeItem(productId);
      return;
    }
    
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index != -1) {
      _items[index].quantity = quantity;
      notifyListeners();
      _saveCart();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
    _saveCart();
  }

  bool isInCart(String productId) {
    return _items.any((item) => item.product.id == productId);
  }

  int getQuantity(String productId) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    return index != -1 ? _items[index].quantity : 0;
  }

  Future<void> _saveCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartJson = _items.map((item) => {
        'product': item.product.toJson(),
        'quantity': item.quantity,
      }).toList();
      await prefs.setString('cart', json.encode(cartJson));
    } catch (e) {
      debugPrint('Error saving cart: $e');
    }
  }

  Future<void> loadCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartString = prefs.getString('cart');
      
      if (cartString != null) {
        final List<dynamic> cartJson = json.decode(cartString);
        _items.clear();
        for (var item in cartJson) {
          _items.add(CartItem(
            product: Product.fromJson(item['product']),
            quantity: item['quantity'],
          ));
        }
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading cart: $e');
    }
  }
}
