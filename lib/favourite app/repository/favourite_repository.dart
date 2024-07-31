import 'package:bloc_practice/favourite%20app/model/favourite_items.dart';

class FavouriteRepository {
  List<FavouriteItemsModel> _generateList(int length) {
    return List.generate(length,
        (length) => FavouriteItemsModel(id: length, title: 'Item $length'));
  }

  Future<List<FavouriteItemsModel>> getItems() async {
    return List.of(_generateList(10));
  }
}
