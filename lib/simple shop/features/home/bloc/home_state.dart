part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeProductSuccessfullyLoadedState extends HomeState {
  final List<GroceryModel> grocery;

  const HomeProductSuccessfullyLoadedState({required this.grocery});
}

class HomeErrorState extends HomeState {}

class HomeProductWihslistButtonClickedState extends HomeState {}

class HomeProductCartButtonClickedState extends HomeState {}

class HomeProductWishlistButtonNavigateClickedState extends HomeActionState {}

class HomeProductCartButtonNavigateClickedState extends HomeActionState {}

class HomeProductWishlestedActionState extends HomeActionState{}

class HomeProductCartedActionState extends HomeActionState{}