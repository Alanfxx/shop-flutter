import 'package:flutter/material.dart';
import 'package:shop/providers/orders.dart';
import 'package:shop/views/cart_screen.dart';
import 'package:shop/views/orders_screen.dart';
import './views/products_overview_screen.dart';
import './utils/app_routes.dart';
import './views/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Minha Loja',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
          AppRoutes.CART: (ctx) => CartScreen(),
          AppRoutes.ORDERS: (ctx) => OrdersScreen(),
          // AppRoutes.HOME: (ctx) => ProductOverviewScreen(),
        },
      ),
    );
  }
}
