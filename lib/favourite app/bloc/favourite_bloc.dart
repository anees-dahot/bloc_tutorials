// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc_practice/favourite%20app/model/favourite_items.dart';
import 'package:bloc_practice/favourite%20app/repository/favourite_repository.dart';
part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteRepository favouriteRepository;
  List<FavouriteItemsModel> favouriteItems = [];
  List<FavouriteItemsModel> temFavouriteItems = [];
  List<FavouriteItemsModel> searchResult = [];
  FavouriteBloc(
    this.favouriteRepository,
  ) : super(FavouriteInitial()) {
    on<FavouriteInitialEvent>(favouriteInitialEvent);
    on<MakeItemFavourite>(makeItemFavourite);
    on<SelectItem>(selectItem);
    on<UnSelectItem>(unSelectItem);
    on<DeleteItem>(deleteItem);
    on<SearchItem>(searchItem);
  }

  FutureOr<void> favouriteInitialEvent(
      FavouriteInitialEvent event, Emitter<FavouriteState> emit) async {
    emit(LoadingState());
    await Future.delayed(const Duration(seconds: 2));
    favouriteItems = await favouriteRepository.getItems();
    emit(DataLoadedState(items: favouriteItems));
  }

  FutureOr<void> makeItemFavourite(
      MakeItemFavourite event, Emitter<FavouriteState> emit) {
    event.itemsModel.isFavourite = !event.itemsModel.isFavourite;
    int index = favouriteItems
        .indexWhere((element) => element.id == event.itemsModel.id);
    if (event.itemsModel.isFavourite) {
      if (temFavouriteItems.contains(favouriteItems[index])) {
        temFavouriteItems.remove(favouriteItems[index]);
        temFavouriteItems.add(event.itemsModel);
      }
    } else {
      if (temFavouriteItems.contains(favouriteItems[index])) {
        temFavouriteItems.remove(favouriteItems[index]);
        temFavouriteItems.add(event.itemsModel);
      }
    }
    emit(LoadingState());
    emit(DataLoadedState(items: favouriteItems));
  }

  FutureOr<void> selectItem(SelectItem event, Emitter<FavouriteState> emit) {
    temFavouriteItems.add(event.itemsModel);
    emit(LoadingState());
    emit(DataLoadedState(items: favouriteItems, temItems: temFavouriteItems));
  }

  FutureOr<void> unSelectItem(
      UnSelectItem event, Emitter<FavouriteState> emit) {
    temFavouriteItems.remove(event.itemsModel);
    emit(LoadingState());
    emit(DataLoadedState(items: favouriteItems, temItems: temFavouriteItems));
  }

  FutureOr<void> deleteItem(DeleteItem event, Emitter<FavouriteState> emit) {
    for (int i = 0; i < temFavouriteItems.length; i++) {
      favouriteItems.remove(temFavouriteItems[i]);
    }
    temFavouriteItems.clear();
    emit(LoadingState());
    emit(DataLoadedState(items: favouriteItems, temItems: temFavouriteItems));
  }

  FutureOr<void> searchItem(SearchItem event, Emitter<FavouriteState> emit) {
    final items = favouriteItems
        .where((element) => element.id.toString() == event.searchQuery)
        .toList();
    if (event.searchQuery.isEmpty) {
      emit(DataLoadedState(
          items: favouriteItems, searchMessage: '', searchItems: []));
    } else if (event.searchQuery.isNotEmpty && items.isEmpty) {
      emit(DataLoadedState(
          items: [], searchMessage: 'No Search Result!', searchItems: items));
    } else if (event.searchQuery.isNotEmpty && items.isNotEmpty) {
      emit(DataLoadedState(items: [], searchMessage: '', searchItems: items));
    }
  }
}
