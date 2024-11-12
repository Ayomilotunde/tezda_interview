// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  final bool? success;
  final String? message;
  final Details? details;

  Address({
    this.success,
    this.message,
    this.details,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    success: json["success"],
    message: json["message"],
    details: json["details"] == null ? null : Details.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "details": details?.toJson(),
  };
}

class Details {
  final String? id;
  final String? firstName;
  final String? lastName;
  final List<AddressElement>? addresses;
  final String? phoneNumber;

  Details({
    this.id,
    this.firstName,
    this.lastName,
    this.addresses,
    this.phoneNumber,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    addresses: json["addresses"] == null ? [] : List<AddressElement>.from(json["addresses"]!.map((x) => AddressElement.fromJson(x))),
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x.toJson())),
    "phoneNumber": phoneNumber,
  };
}

class AddressElement {
  final String? streetAdd;
  final String? state;
  final String? localGovt;
  final String? city;
  final bool? active;
  final String? id;
  final String? direction;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;

  AddressElement({
    this.streetAdd,
    this.state,
    this.localGovt,
    this.city,
    this.active,
    this.id,
    this.direction,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  factory AddressElement.fromJson(Map<String, dynamic> json) => AddressElement(
    streetAdd: json["streetAdd"],
    state: json["state"],
    localGovt: json["localGovt"],
    city: json["city"],
    active: json["active"],
    id: json["_id"],
    direction: json["direction"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "streetAdd": streetAdd,
    "state": state,
    "localGovt": localGovt,
    "city": city,
    "active": active,
    "_id": id,
    "direction": direction,
    "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
  };
}
