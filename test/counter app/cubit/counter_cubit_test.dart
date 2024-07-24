import 'package:bloc_practice/counter%20app/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit? counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit!.close();
    });

    test(
        'The initial state for the CounterCubit is CounterState(counterValue:0)',
        () {
      expect(counterCubit!.state, CounterState(counterValue: 0));
    });

    blocTest(
      'emits CounterState(counterValue: 1, wasIncremented = true) when cubit.inrement() function is called.',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );
    blocTest(
      'emits CounterState(counterValue: -1, wasIncremented = false) when cubit.decrement() function is called.',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
