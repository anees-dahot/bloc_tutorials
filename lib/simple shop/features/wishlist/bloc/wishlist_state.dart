part of 'wishlist_bloc.dart';

sealed class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object> get props => [];
}

abstract class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WIshlistDataLoadedSuccessfullyState extends WishlistState {
  final List<GroceryModel> groceryModel;

  const WIshlistDataLoadedSuccessfullyState({required this.groceryModel});
}

class WishlistErrorState extends WishlistState {
  final String error;

  const WishlistErrorState({required this.error});
}

class RemoveFromWishlistActionState extends WishlistActionState {}
