// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favourite_bloc.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

final class FavouriteInitial extends FavouriteState {}

class LoadingState extends FavouriteState {}

class DataLoadedState extends FavouriteState {
  final List<FavouriteItemsModel> items;
  List<FavouriteItemsModel> temItems;

  DataLoadedState({
    this.temItems = const [],
    required this.items,
  });
}
