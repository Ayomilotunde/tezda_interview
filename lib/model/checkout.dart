import 'dart:convert';

class Checkout {
  final bool? success;
  final Data? data;

  Checkout({
    this.success,
    this.data,
  });

  factory Checkout.fromRawJson(String str) => Checkout.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Checkout.fromJson(Map<String, dynamic> json) => Checkout(
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
  final String? user;
  final List<CheckoutItem>? items;
  final int? totalAmount;
  final List<String>? logisticId;
  final double? estimatedDeliveryAmount;
  final int? v;
  final DateTime? updatedAt;

  Data({
    this.id,
    this.user,
    this.items,
    this.totalAmount,
    this.logisticId,
    this.estimatedDeliveryAmount,
    this.v,
    this.updatedAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    user: json["user"],
    items: json["items"] == null ? [] : List<CheckoutItem>.from(json["items"]!.map((x) => CheckoutItem.fromJson(x))),
    totalAmount: json["totalAmount"],
    logisticId: json["logisticId"] == null ? [] : List<String>.from(json["logisticId"]!.map((x) => x)),
    estimatedDeliveryAmount: json["estimatedDeliveryAmount"]?.toDouble(),
    v: json["__v"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "totalAmount": totalAmount,
    "logisticId": logisticId == null ? [] : List<dynamic>.from(logisticId!.map((x) => x)),
    "estimatedDeliveryAmount": estimatedDeliveryAmount,
    "__v": v,
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class CheckoutItem {
  final Product? product;
  final int? quantity;
  final int? price;
  final String? id;

  CheckoutItem({
    this.product,
    this.quantity,
    this.price,
    this.id,
  });

  factory CheckoutItem.fromRawJson(String str) => CheckoutItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CheckoutItem.fromJson(Map<String, dynamic> json) => CheckoutItem(
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    quantity: json["quantity"],
    price: json["price"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "product": product?.toJson(),
    "quantity": quantity,
    "price": price,
    "_id": id,
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
