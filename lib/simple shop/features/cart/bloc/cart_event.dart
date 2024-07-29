part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartInitialEvent extends CartEvent {}

class RemoveFromCartEvent extends CartEvent {
  final GroceryModel groceryModel;

  const RemoveFromCartEvent({required this.groceryModel});
}
