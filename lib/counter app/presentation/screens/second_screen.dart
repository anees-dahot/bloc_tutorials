import 'package:bloc_practice/counter%20app/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.title});
  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
            BlocConsumer<CounterCubit, CounterState>(
             listener: (context, state) {
         if(state.wasIncremented == true){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text( 'Counter value inremented'), duration: Duration(microseconds: 100)));
         }
         else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text( 'Counter value decremented'), duration: Duration(microseconds: 100),));
         }
        },
              builder: (context, state) {
                if (state.counterValue == 2) {
                  return Text(
                    'OHHH, an even ${state.counterValue.toString()}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                else if (state.counterValue < 0) {
                  return Text(
                    'BRRRR, Negtive ${state.counterValue.toString()}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
               else if (state.counterValue == 5) {
                  return Text(
                    'DANG, a Five!!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            SizedBox(
              height: 43,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
