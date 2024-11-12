// To parse this JSON data, do
//
//     final orderHistory = orderHistoryFromJson(jsonString);

import 'dart:convert';

OrderHistory orderHistoryFromJson(String str) => OrderHistory.fromJson(json.decode(str));

String orderHistoryToJson(OrderHistory data) => json.encode(data.toJson());

class OrderHistory {
  final bool? success;
  final List<Order>? orders;

  OrderHistory({
    this.success,
    this.orders,
  });

  factory OrderHistory.fromJson(Map<String, dynamic> json) => OrderHistory(
    success: json["success"],
    orders: json["orders"] == null ? [] : List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "orders": orders == null ? [] : List<dynamic>.from(orders!.map((x) => x.toJson())),
  };
}

class Order {
  final String? id;
  final String? user;
  final List<ProductElement>? products;
  final int? totalAmount;
  final String? status;
  final bool? isPaid;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Order({
    this.id,
    this.user,
    this.products,
    this.totalAmount,
    this.status,
    this.isPaid,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["_id"],
    user: json["user"],
    products: json["products"] == null ? [] : List<ProductElement>.from(json["products"]!.map((x) => ProductElement.fromJson(x))),
    totalAmount: json["totalAmount"],
    status: json["status"],
    isPaid: json["isPaid"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "totalAmount": totalAmount,
    "status": status,
    "isPaid": isPaid,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class ProductElement {
  final ProductProduct? product;
  final int? quantity;
  final int? priceAtPurchase;
  final String? orderStatus;
  final String? id;

  ProductElement({
    this.product,
    this.quantity,
    this.priceAtPurchase,
    this.orderStatus,
    this.id,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
    product: json["product"] == null ? null : ProductProduct.fromJson(json["product"]),
    quantity: json["quantity"],
    priceAtPurchase: json["priceAtPurchase"],
    orderStatus: json["orderStatus"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "product": product?.toJson(),
    "quantity": quantity,
    "priceAtPurchase": priceAtPurchase,
    "orderStatus": orderStatus,
    "_id": id,
  };
}

class ProductProduct {
  final String? id;
  final String? name;
  final String? description;
  final int? price;
  final List<String>? images;

  ProductProduct({
    this.id,
    this.name,
    this.description,
    this.price,
    this.images,
  });

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "price": price,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
  };
}
