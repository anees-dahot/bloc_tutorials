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
  List<FavouriteItemsModel> searchItems;
  final String searchMessage;

  DataLoadedState(
      {this.temItems = const [], required this.items, this.searchMessage = '', this.searchItems =  const []});

  DataLoadedState copyWith({
    List<FavouriteItemsModel>? items,
    List<FavouriteItemsModel>? temItems,
    List<FavouriteItemsModel>? searchItem,
    String? searchMessage,
  }) {
    return DataLoadedState(
      items: items ?? this.items,
      temItems: temItems ?? this.temItems,
      searchItems: searchItems ?? this.searchItems,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object> get props => [items, temItems, searchMessage, searchItems];
}
