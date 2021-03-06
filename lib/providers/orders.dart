import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'cart.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  Order({
    this.id,
    this.total,
    this.products,
    this.date,
  });
}

class Orders with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    // final total = products.fold(0.0, (t, e) => t + e.price * e.quantity);

    Order order = Order(
      id: Random().nextDouble().toString(),
      total: cart.totalAmount,
      products: cart.items.values.toList(),
      date: DateTime.now(),
    );

    _items.insert(0, order);
    notifyListeners();
  }
}
