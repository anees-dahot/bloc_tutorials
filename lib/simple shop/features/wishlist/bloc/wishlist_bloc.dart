import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/simple%20shop/data/wishlist_items.dart';
import 'package:bloc_practice/simple%20shop/models/grocery.dart';
import 'package:equatable/equatable.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<RemoveFromWishlistEvent>(removeFromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WIshlistDataLoadedSuccessfullyState(groceryModel: wishlistItems));
  }

  FutureOr<void> removeFromWishlistEvent(RemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    
    emit(WishlistLoadingState());
    try {
      wishlistItems.remove(event.groceryModel);
      emit(WIshlistDataLoadedSuccessfullyState(groceryModel: wishlistItems));
      emit(RemoveFromWishlistActionState())
;    } catch (e) {
      emit(WishlistErrorState(error: e.toString()));
    }

  }
}
