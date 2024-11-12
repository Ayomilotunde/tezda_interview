// To parse this JSON data, do
//
//     final orderDetails = orderDetailsFromJson(jsonString);

import 'dart:convert';

OrderDetails orderDetailsFromJson(String str) => OrderDetails.fromJson(json.decode(str));

String orderDetailsToJson(OrderDetails data) => json.encode(data.toJson());

class OrderDetails {
  final bool? success;
  final Order? order;

  OrderDetails({
    this.success,
    this.order,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        success: json["success"],
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "order": order?.toJson(),
      };
}

class Order {
  final String? id;
  final User? user;
  final List<ProductElement>? products;
  final int? totalAmount;
  final String? status;
  final bool? isPaid;
  final String? paymentMethod;
  final String? deliveryOption;
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
    this.paymentMethod,
    this.deliveryOption,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        products: json["products"] == null
            ? []
            : List<ProductElement>.from(json["products"]!.map((x) => ProductElement.fromJson(x))),
        totalAmount: json["totalAmount"],
        status: json["status"],
        isPaid: json["isPaid"],
        paymentMethod: json["paymentMethod"],
        deliveryOption: json["deliveryOption"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "totalAmount": totalAmount,
        "status": status,
        "isPaid": isPaid,
        "paymentMethod": paymentMethod,
        "deliveryOption": deliveryOption,
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
  final List<String>? images;

  ProductProduct({
    this.id,
    this.name,
    this.images,
  });

  factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        id: json["_id"],
        name: json["name"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
      };
}

class User {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}
