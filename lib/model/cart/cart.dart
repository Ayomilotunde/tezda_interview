import 'dart:convert';

class Cart {
  final bool? success;
  final Data? data;

  Cart({
    this.success,
    this.data,
  });

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  final String? id;
  final List<CartResponseItem>? items;
  final int? totalAmount;
  final List<String>? logisticId;
  final double? estimatedDeliveryAmount;
  final bool? isRetailerCart;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Data({
    this.id,
    this.items,
    this.totalAmount,
    this.logisticId,
    this.estimatedDeliveryAmount,
    this.isRetailerCart,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        items: json["items"] == null
            ? []
            : List<CartResponseItem>.from(json["items"]!.map((x) => CartResponseItem.fromJson(x))),
        totalAmount: json["totalAmount"],
        logisticId: json["logisticId"] == null ? [] : List<String>.from(json["logisticId"]!.map((x) => x)),
        estimatedDeliveryAmount: json["estimatedDeliveryAmount"]?.toDouble(),
        isRetailerCart: json["isRetailerCart"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "totalAmount": totalAmount,
        "logisticId": logisticId == null ? [] : List<dynamic>.from(logisticId!.map((x) => x)),
        "estimatedDeliveryAmount": estimatedDeliveryAmount,
        "isRetailerCart": isRetailerCart,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class CartResponseItem {
  final PriceRange? priceRange;
  final Product? product;
  final int? quantity;
  final int? price;
  final String? id;

  CartResponseItem({
    this.priceRange,
    this.product,
    this.quantity,
    this.price,
    this.id,
  });

  factory CartResponseItem.fromRawJson(String str) => CartResponseItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CartResponseItem.fromJson(Map<String, dynamic> json) => CartResponseItem(
        priceRange: json["priceRange"] == null ? null : PriceRange.fromJson(json["priceRange"]),
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        quantity: json["quantity"],
        price: json["price"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "priceRange": priceRange?.toJson(),
        "product": product?.toJson(),
        "quantity": quantity,
        "price": price,
        "_id": id,
      };
}

class PriceRange {
  final int? minQuantity;
  final int? maxQuantity;
  final int? price;

  PriceRange({
    this.minQuantity,
    this.maxQuantity,
    this.price,
  });

  factory PriceRange.fromRawJson(String str) => PriceRange.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        minQuantity: json["minQuantity"],
        maxQuantity: json["maxQuantity"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "minQuantity": minQuantity,
        "maxQuantity": maxQuantity,
        "price": price,
      };
}

class Product {
  final String? id;
  final String? name;
  final int? price;
  final int? quantity;
  final int? discount;
  final List<String>? images;

  Product({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.discount,
    this.images,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        discount: json["discount"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "quantity": quantity,
        "discount": discount,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}
