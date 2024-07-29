import 'package:bloc_practice/simple%20shop/features/cart/screens/cart.dart';
import 'package:bloc_practice/simple%20shop/features/home/screens/home_screen.dart';
import 'package:bloc_practice/simple%20shop/features/wishlist/screens/wishlist.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const Home());
      case '/cart':
        return MaterialPageRoute(builder: (_) => const Cart());
      case '/wishlist':
        return MaterialPageRoute(builder: (_) => const Wishlist());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                    body: Center(
                  child: Text('No route found.'),
                )));
    }
  }
}
