part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWihslistButtonClickedEvent extends HomeEvent {
  final GroceryModel groceryModel;

  const HomeProductWihslistButtonClickedEvent({required this.groceryModel});
}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final GroceryModel groceryModel;

  const HomeProductCartButtonClickedEvent({required this.groceryModel});
}

class HomeProductWishlistButtonNavigateClickedEvent extends HomeEvent {}

class HomeProductCartButtonNavigateClickedEvent extends HomeEvent {}
