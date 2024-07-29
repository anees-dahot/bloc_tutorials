import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/counter%20app/constants/enums.dart';
import 'package:bloc_practice/counter%20app/logic/cubit/internet_cubit.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription streamSubscription;
  CounterCubit({required this.internetCubit}) : super(CounterState(counterValue: 0)){
    subsciption();
  }

  void subsciption() {
    streamSubscription = internetCubit.stream.listen((internetState){
      if(internetState is InternetConnected && internetState.connectionType == ConnectionType.wifi){
    increment();
      }
     else if(internetState is InternetConnected && internetState.connectionType == ConnectionType.mobile){
    decrement();
      }
    });
  }

  void increment() => emit(CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
  @override
  Future<void> close() {
    // TODO: implement close
    streamSubscription.cancel();
    return super.close();
  }
}
