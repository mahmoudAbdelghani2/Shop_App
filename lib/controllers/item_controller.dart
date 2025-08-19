import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart_item.dart';

class ControllerItem extends ChangeNotifier {
  final List<CartItems> _items = [];
  List<CartItems> get items => _items;

  double get subtotal {
    double total = 0.0;
    for (var item in _items) {
      total += (item.price ?? 0) * item.quantity;
    }
    return total;
  }

  double get totalTax {
    double total = 0.0;
    for (var item in _items) {
      total += item.tax;
    }
    return total;
  }

  double get total {
    return subtotal + totalTax;
  }

  void removeItem(CartItems item) {
    final originalItem = CartItems.getItemByID(item.id);
    if (originalItem != null) {
      originalItem.isAdded = false;
    }

    _items.removeWhere((i) => i.id == item.id);
    notifyListeners();
  }

  void addItem(CartItems item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      item.isAdded = true;
      _items.add(item);
    }
    notifyListeners();
  }

  void clearItems() {
    for (var item in _items) {
      item.isAdded = false;
      item.quantity = 1;
    }
    _items.clear();
    notifyListeners();
  }

  void incrementItem(CartItems item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _items[index].quantity += 1;
    } else {
      item.quantity = 1;
      item.isAdded = true;
      _items.add(item);
    }
    notifyListeners();
  }

  void decrementItem(CartItems item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index == -1) return;
    if (_items[index].quantity > 1) {
      _items[index].quantity -= 1;
      notifyListeners();
    } else {
      removeItem(item);
    }
  }

  int getQuantity(CartItems item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) return _items[index].quantity;
    return item.quantity;
  }

  void toggleItemAdded(CartItems item) {
    final index = _items.indexOf(item);
    if (index != -1) {
      _items[index].isAdded = !_items[index].isAdded;
      notifyListeners();
    }
  }
}
