import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/simple%20shop/data/cart_items.dart';
import 'package:equatable/equatable.dart';

import '../../../models/grocery.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveFromCartEvent>(removeFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    try {
      emit(CartDataLoadedSuccessfullyState(items: cartItems));
    } catch (e) {
      emit(CartErrorState(error: e.toString()));
    }
  }

  FutureOr<void> removeFromCartEvent(
      RemoveFromCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    try {
      cartItems.remove(event.groceryModel);
      emit(CartDataLoadedSuccessfullyState(items: cartItems));
      emit(RemoveFromCartActionState())
;    } catch (e) {
      emit(CartErrorState(error: e.toString()));
    }
  }
}
