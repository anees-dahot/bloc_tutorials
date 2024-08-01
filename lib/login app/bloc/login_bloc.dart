import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginFunctionEvent>(loginFunctionEvent);
  }

  FutureOr<void> loginFunctionEvent(
      LoginFunctionEvent event, Emitter<LoginState> emit) async {
    emit(LoadingState());
    Map data = {'username': event.email, 'password': event.password};
    try {
      final res = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        body: data,
        // headers: {'Content-Type': 'application/json'},
      );
      if (res.statusCode == 200) {
        emit(SuccessState());
      } else {
        emit(ErrorState(error: 'Sometig went wrong!'));
      }
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
