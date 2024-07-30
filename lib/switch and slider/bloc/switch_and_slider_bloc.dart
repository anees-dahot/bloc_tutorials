import 'dart:async';

import 'package:bloc_practice/switch%20and%20slider/bloc/switch_and_slider_event.dart';
import 'package:bloc_practice/switch%20and%20slider/bloc/switch_and_slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpacityBloc extends Bloc<OpacityEvent, OpacityState> {
  OpacityBloc() : super(const OpacityState(1.0)) {
    on<ChangeOpacity>(_onChangeOpacity);
   
  }

  void _onChangeOpacity(ChangeOpacity event, Emitter<OpacityState> emit) {
    emit(OpacityState(event.opacity));
  }

  FutureOr<void> notificationEvent(NotificationEvent event, Emitter<OpacityState> emit) {
  }
}

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState(true)) {
  
    on<NotificationEvent>(notificationEvent);
  }

  void notificationEvent(NotificationEvent event, Emitter<NotificationState> emit) {
    emit(NotificationState(event.status));
  }

 
}