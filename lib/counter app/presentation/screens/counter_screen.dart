import 'package:bloc_practice/constants/enums.dart';
import 'package:bloc_practice/counter%20app/logic/cubit/counter_cubit.dart';
import 'package:bloc_practice/counter%20app/logic/cubit/internet_cubit.dart';
import 'package:bloc_practice/counter%20app/presentation/screens/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocConsumer<InternetCubit, InternetState>(
              listener: (context, state) {
                // if (state is InternetConnected && state.connectionType == ConnectionType.mobile) {
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //       content: Text('Counter value inremented'),
                //       duration: Duration(microseconds: 100)));
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //     content: Text('Counter value decremented'),
                //     duration: Duration(microseconds: 100),
                //   ));
                // }
               
              },
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return Text(
                    'MObile',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return Text(
                    'WIFI',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                return Text('no internet');
              },
            ),
            const SizedBox(
              height: 43,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  heroTag: 'screen1Fab',
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: 'screen1Fab2',
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second-screen');
                },
                child: const Text('Second Screen')),
          ],
        ),
      ),
    );
  }
}
