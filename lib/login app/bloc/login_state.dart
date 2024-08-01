part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

abstract class LoginActionState extends LoginState{}

final class LoginInitial extends LoginState {}

class LoadingState extends LoginActionState {}

class ErrorState extends LoginActionState {
  final String error;

  ErrorState({required this.error});
}

class SuccessState extends LoginActionState {}
