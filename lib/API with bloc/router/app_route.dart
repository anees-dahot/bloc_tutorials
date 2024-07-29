import 'package:bloc_practice/API%20with%20bloc/features/posts/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const PostsScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                    body: Center(
                  child: Text('No route found.'),
                )));
    }
  }
}
