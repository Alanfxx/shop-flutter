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
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> products, double total) {
    // final total = products.fold(0.0, (t, e) => t + e.price * e.quantity);

    Order order = Order(
      id: Random().nextDouble().toString(),
      total: total,
      products: products,
      date: DateTime.now(),
    );

    _orders.insert(0, order);
    notifyListeners();
  }
}
