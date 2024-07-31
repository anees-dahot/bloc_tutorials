// ignore_for_file: public_member_api_docs, sort_constructors_first
class FavouriteItemsModel {
  final int id;
  final String title;
  bool isFavourite;
  bool isDeleting;
  FavouriteItemsModel({
    required this.id,
    required this.title,
     this.isFavourite = false,
     this.isDeleting = false,
  });

  FavouriteItemsModel copyWith({
    int? id,
    String? title,
    bool? isFavourite,
    bool? isDeleting,
  }) {
    return FavouriteItemsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isFavourite: isFavourite ?? this.isFavourite,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }
}
