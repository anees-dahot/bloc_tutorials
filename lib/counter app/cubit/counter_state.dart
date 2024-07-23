// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool wasIncremented;
  CounterState({
    required this.counterValue,
    this.wasIncremented = false,
  });
}
