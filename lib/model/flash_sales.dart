import 'dart:convert';

class FlashSales {
  final bool? success;
  final List<FlashSaleProduct>? flashSaleProducts;
  final int? totalPages;
  final int? totalFlashSales;
  final int? currentPage;

  FlashSales({
    this.success,
    this.flashSaleProducts,
    this.totalPages,
    this.totalFlashSales,
    this.currentPage,
  });

  factory FlashSales.fromRawJson(String str) =>
      FlashSales.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FlashSales.fromJson(Map<String, dynamic> json) => FlashSales(
        success: json["success"],
        flashSaleProducts: json["flashSaleProducts"] == null
            ? []
            : List<FlashSaleProduct>.from(json["flashSaleProducts"]!
                .map((x) => FlashSaleProduct.fromJson(x))),
        totalPages: json["totalPages"],
        totalFlashSales: json["totalFlashSales"],
        currentPage: json["currentPage"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "flashSaleProducts": flashSaleProducts == null
            ? []
            : List<dynamic>.from(flashSaleProducts!.map((x) => x.toJson())),
        "totalPages": totalPages,
        "totalFlashSales": totalFlashSales,
        "currentPage": currentPage,
      };
}

class FlashSaleProduct {
  final String? id;
  final String? name;
  final String? description;
  final int? price;
  final int? quantity;
  final Category? category;
  final Wholesaler? wholesaler;
  final List<String>? images;
  final bool? favorited;

  FlashSaleProduct({
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.category,
    this.wholesaler,
    this.images,
    this.favorited,
  });

  factory FlashSaleProduct.fromRawJson(String str) =>
      FlashSaleProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FlashSaleProduct.fromJson(Map<String, dynamic> json) =>
      FlashSaleProduct(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        wholesaler: json["wholesaler"] == null
            ? null
            : Wholesaler.fromJson(json["wholesaler"]),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        favorited: json["favorited"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "category": category?.toJson(),
        "wholesaler": wholesaler?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "favorited": favorited,
      };
}

class Category {
  final String? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromRawJson(String str) =>
      Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class Wholesaler {
  final String? id;
  final String? storeName;

  Wholesaler({
    this.id,
    this.storeName,
  });

  factory Wholesaler.fromRawJson(String str) =>
      Wholesaler.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Wholesaler.fromJson(Map<String, dynamic> json) => Wholesaler(
        id: json["_id"],
        storeName: json["storeName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "storeName": storeName,
      };
}
