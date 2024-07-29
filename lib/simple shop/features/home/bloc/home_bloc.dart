import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/simple%20shop/data/cart_items.dart';
import 'package:bloc_practice/simple%20shop/data/grocery_data.dart';
import 'package:bloc_practice/simple%20shop/data/wishlist_items.dart';
import 'package:bloc_practice/simple%20shop/models/grocery.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonNavigateClickedEvent>(
        homeProductWishlistButtonNavigateClickedEvent);
    on<HomeProductCartButtonNavigateClickedEvent>(
        homeProductCartButtonNavigateClickedEvent);
    on<HomeProductWihslistButtonClickedEvent>(
        homeProductWihslistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeProductSuccessfullyLoadedState(
        grocery: GroceryData.groceryItems
            .map((e) => GroceryModel(
                id: e['id'],
                name: e['name'],
                image: e['image'],
                description: e['description'],
                price: e['price']))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonNavigateClickedEvent(
      HomeProductWishlistButtonNavigateClickedEvent event,
      Emitter<HomeState> emit) {
    print('Wishlist navigate clicked');
    emit(HomeProductWishlistButtonNavigateClickedState());
  }

  FutureOr<void> homeProductCartButtonNavigateClickedEvent(
      HomeProductCartButtonNavigateClickedEvent event,
      Emitter<HomeState> emit) {
    print('Cart navigate clicked');
    emit(HomeProductCartButtonNavigateClickedState());
  }

  FutureOr<void> homeProductWihslistButtonClickedEvent(
      HomeProductWihslistButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Product wishlist button clicked');
    wishlistItems.add(event.groceryModel);
    emit(HomeProductWishlestedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Product item button clicked');
    cartItems.add(event.groceryModel);
    emit(HomeProductCartedActionState());
  }
}
