import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_item.dart';

class ControllerItem extends ChangeNotifier {
  final List<CartItems> _items = [];
  List<CartItems> get items => _items;

  void addItem(CartItems item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(CartItems item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearItems() {
    _items.clear();
    notifyListeners();
  }
  void toggleItemAdded(CartItems item) {
    final index = _items.indexOf(item);
    if (index != -1) {
      _items[index].isAdded = !_items[index].isAdded;
      notifyListeners();
    }
  }
}