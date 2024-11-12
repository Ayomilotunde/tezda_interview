import 'dart:convert';

class Products {
  final bool? success;
  final String? message;
  final List<Product>? products;
  final int? totalCount;
  final int? currentPage;
  final int? totalPages;

  Products({
    this.success,
    this.message,
    this.products,
    this.totalCount,
    this.currentPage,
    this.totalPages,
  });

  factory Products.fromRawJson(String str) => Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        success: json["success"],
        message: json["message"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        totalCount: json["totalCount"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "totalCount": totalCount,
        "currentPage": currentPage,
        "totalPages": totalPages,
      };
}

class Product {
  final String? id;
  final String? name;
  final String? description;
  final int? price;
  final int? quantity;
  final Category? category;
  final List<String>? images;
  bool? favorited;
  final List<VendorPriceRange>? vendorPriceRanges;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.category,
    this.images,
    this.favorited,
    this.vendorPriceRanges,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        favorited: json["favorited"],
        vendorPriceRanges: json["vendorPriceRanges"] == null
            ? []
            : List<VendorPriceRange>.from(json["vendorPriceRanges"]!.map((x) => VendorPriceRange.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "price": price,
        "quantity": quantity,
        "category": category?.toJson(),
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "favorited": favorited,
        "vendorPriceRanges":
            vendorPriceRanges == null ? [] : List<dynamic>.from(vendorPriceRanges!.map((x) => x.toJson())),
      };
}

class Category {
  final String? name;

  Category({
    this.name,
  });

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class VendorPriceRange {
  final int? minQuantity;
  final int? maxQuantity;
  final int? price;
  final String? id;

  VendorPriceRange({
    this.minQuantity,
    this.maxQuantity,
    this.price,
    this.id,
  });

  factory VendorPriceRange.fromRawJson(String str) => VendorPriceRange.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VendorPriceRange.fromJson(Map<String, dynamic> json) => VendorPriceRange(
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
