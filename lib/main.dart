import 'package:bloc_practice/counter%20app/logic/cubit/counter_cubit.dart';
import 'package:bloc_practice/counter%20app/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter app/presentation/screens/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CounterCubit counterCubit = CounterCubit();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
              value: counterCubit,
              child: const MyHomePage(title: 'Counter Screen'),
            ),
        '/second-screen': (context) => BlocProvider.value(
              value: counterCubit,
              child: const SecondScreen(title: 'Second Screen'),
            ),
      },
    );
  }
}
