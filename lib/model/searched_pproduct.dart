// To parse this JSON data, do
//
//     final searchedByCategory = searchedByCategoryFromMap(jsonString);

import 'dart:convert';

SearchedByCategory searchedByCategoryFromMap(String str) =>
    SearchedByCategory.fromMap(json.decode(str));

String searchedByCategoryToMap(SearchedByCategory data) =>
    json.encode(data.toMap());

class SearchedByCategory {
  final bool? success;
  final List<SearchedProduct>? searchProduct;

  SearchedByCategory({
    this.success,
    this.searchProduct,
  });

  factory SearchedByCategory.fromMap(Map<String, dynamic> json) =>
      SearchedByCategory(
        success: json["success"],
        searchProduct: json["products"] == null
            ? []
            : List<SearchedProduct>.from(
                json["products"]!.map((x) => SearchedProduct.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "products": searchProduct == null
            ? []
            : List<dynamic>.from(searchProduct!.map((x) => x.toMap())),
      };
}

class SearchedProduct {
  final String? longDesc;
  final dynamic id;
  final String? name;
  final String? description;
  final int? price;
  final int? quantity;
  final int? discount;
  final dynamic category;
  final String? subcategory;
  final dynamic wholesaler;
  final List<String>? images;
  final bool? isApproved;
  final bool? isFlashSale;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? slug;
  final int? v;
  final List<String>? favoritedBy;

  SearchedProduct({
    this.longDesc,
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.discount,
    this.category,
    this.subcategory,
    this.wholesaler,
    this.images,
    this.isApproved,
    this.isFlashSale,
    this.createdAt,
    this.updatedAt,
    this.slug,
    this.v,
    this.favoritedBy,
  });

  factory SearchedProduct.fromMap(Map<String, dynamic> json) => SearchedProduct(
        longDesc: json["longDesc"],
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        discount: json["discount"],
        category: json["category"],
        subcategory: json["subcategory"],
        wholesaler: json["wholesaler"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        isApproved: json["isApproved"],
        isFlashSale: json["isFlashSale"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        slug: json["slug"],
        v: json["__v"],
        favoritedBy: json["favoritedBy"] == null
            ? []
            : List<String>.from(json["favoritedBy"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "longDesc": longDesc,
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "discount": discount,
        "category": category,
        "subcategory": subcategory,
        "wholesaler": wholesaler,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "isApproved": isApproved,
        "isFlashSale": isFlashSale,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "slug": slug,
        "__v": v,
        "favoritedBy": favoritedBy == null
            ? []
            : List<dynamic>.from(favoritedBy!.map((x) => x)),
      };
}
