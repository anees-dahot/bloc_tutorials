import 'package:bloc_practice/counter%20app/presentation/screens/counter_screen.dart';
import 'package:bloc_practice/counter%20app/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const MyHomePage(title: 'Counter Screen'));
      case '/second-screen':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(title: 'Second Screen'));

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                    body:  Center(
                  child: Text('No route found.'),
                )));
    }
  }
}
