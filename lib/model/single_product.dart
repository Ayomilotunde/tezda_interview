import 'dart:convert';

class SingleProduct {
  final bool? success;
  final Details? details;

  SingleProduct({
    this.success,
    this.details,
  });

  factory SingleProduct.fromRawJson(String str) =>
      SingleProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SingleProduct.fromJson(Map<String, dynamic> json) => SingleProduct(
        success: json["success"],
        details:
            json["details"] == null ? null : Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "details": details?.toJson(),
      };
}

class Details {
  final String? id;
  final String? name;
  final String? description;
  final int? price;
  final int? quantity;
  final int? discount;
  final Category? category;
  final Wholesaler? wholesaler;
  final List<String>? images;
  final String? longDesc;
  final int? minOrderQty;
  final List<PriceRange>? priceRanges;
  final BusinessDeveloper? businessDeveloper;
  final String? slug;
  final int? v;

  Details({
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.discount,
    this.category,
    this.wholesaler,
    this.images,
    this.longDesc,
    this.minOrderQty,
    this.priceRanges,
    this.businessDeveloper,
    this.slug,
    this.v,
  });

  factory Details.fromRawJson(String str) => Details.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        discount: json["discount"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        wholesaler: json["wholesaler"] == null
            ? null
            : Wholesaler.fromJson(json["wholesaler"]),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        longDesc: json["longDesc"],
        minOrderQty: json["minOrderQty"],
        priceRanges: json["priceRanges"] == null
            ? []
            : List<PriceRange>.from(
                json["priceRanges"]!.map((x) => PriceRange.fromJson(x))),
        businessDeveloper: json["businessDeveloper"] == null
            ? null
            : BusinessDeveloper.fromJson(json["businessDeveloper"]),
        slug: json["slug"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "discount": discount,
        "category": category?.toJson(),
        "wholesaler": wholesaler?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "longDesc": longDesc,
        "minOrderQty": minOrderQty,
        "priceRanges": priceRanges == null
            ? []
            : List<dynamic>.from(priceRanges!.map((x) => x.toJson())),
        "businessDeveloper": businessDeveloper?.toJson(),
        "slug": slug,
        "__v": v,
      };
}

class BusinessDeveloper {
  final String? id;
  final String? firstName;
  final String? lastName;

  BusinessDeveloper({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory BusinessDeveloper.fromRawJson(String str) =>
      BusinessDeveloper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BusinessDeveloper.fromJson(Map<String, dynamic> json) =>
      BusinessDeveloper(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
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

class PriceRange {
  final int? minQuantity;
  final int? maxQuantity;
  final int? price;
  final String? id;

  PriceRange({
    this.minQuantity,
    this.maxQuantity,
    this.price,
    this.id,
  });

  factory PriceRange.fromRawJson(String str) =>
      PriceRange.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        minQuantity: json["minQuantity"],
        maxQuantity: json["maxQuantity"],
        price: json["price"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "minQuantity": minQuantity,
        "maxQuantity": maxQuantity,
        "price": price,
        "_id": id,
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
