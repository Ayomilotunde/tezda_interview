// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

// OrderData orderFromJson(String str) => OrderData.fromJson(json.decode(str));

String orderToJson(OrderData data) => json.encode(data.toJson());

class OrderData {
  final List<Product>? products;
  final String? paymentMethod;
  final String? deliveryOption;

  OrderData({
    this.products,
    this.paymentMethod,
    this.deliveryOption,
  });

  Map<String, dynamic> toJson() => {
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "paymentMethod": paymentMethod ?? "cash",
        "deliveryOption": deliveryOption ?? "pickup",
      };
}

class Product {
  final String? productId;
  final int? quantity;

  Product({
    this.productId,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
