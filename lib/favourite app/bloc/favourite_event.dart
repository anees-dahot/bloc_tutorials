// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FavouriteInitialEvent extends FavouriteEvent {}

class MakeItemFavourite extends FavouriteEvent {
  FavouriteItemsModel itemsModel;
  MakeItemFavourite({
    required this.itemsModel,
  });
}

class SelectItem extends FavouriteEvent {
  FavouriteItemsModel itemsModel;
  SelectItem({
    required this.itemsModel,
  });
}

class UnSelectItem extends FavouriteEvent {
  FavouriteItemsModel itemsModel;
  UnSelectItem({
    required this.itemsModel,
  });
}

class DeleteItem extends FavouriteEvent {}
