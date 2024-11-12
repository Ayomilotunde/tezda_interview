// To parse this JSON data, do
//
//     final favouriteResponse = favouriteResponseFromJson(jsonString);

import 'dart:convert';

FavouriteResponse favouriteResponseFromJson(String str) => FavouriteResponse.fromJson(json.decode(str));

String favouriteResponseToJson(FavouriteResponse data) => json.encode(data.toJson());

class FavouriteResponse {
  final bool? success;
  final List<Favorite>? favorites;
  final String? message;

  FavouriteResponse({
    this.success,
    this.favorites,
    this.message,
  });

  factory FavouriteResponse.fromJson(Map<String, dynamic> json) => FavouriteResponse(
    success: json["success"],
    favorites: json["favorites"] == null ? [] : List<Favorite>.from(json["favorites"]!.map((x) => Favorite.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "favorites": favorites == null ? [] : List<dynamic>.from(favorites!.map((x) => x.toJson())),
    "message": message,
  };
}

class Favorite {
  final String? id;
  final String? name;
  final int? price;
  final List<String>? images;
  final String? slug;

  Favorite({
    this.id,
    this.name,
    this.price,
    this.images,
    this.slug,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
    id: json["_id"],
    name: json["name"],
    price: json["price"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "price": price,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "slug": slug,
  };
}
