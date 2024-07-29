part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

abstract class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartDataLoadedSuccessfullyState extends CartState {
  final List<GroceryModel> items;

  const CartDataLoadedSuccessfullyState({required this.items});
}

class CartErrorState extends CartState {
  final String error;

  const CartErrorState({required this.error});
}

class RemoveFromCartActionState extends CartActionState {}
