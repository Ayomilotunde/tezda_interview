import 'dart:convert';

class UserProfile {
  final bool? success;
  final String? message;
  final User? user;

  UserProfile({
    this.success,
    this.message,
    this.user,
  });

  factory UserProfile.fromRawJson(String str) => UserProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    success: json["success"],
    message: json["message"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "user": user?.toJson(),
  };
}

class User {
  final String? id;
  final String? firstName;
  final String? lastName;
  final bool? isVerified;
  final String? userType;
  final String? email;
  final List<MyAddresses>? addresses;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? phoneNumber;
  final String? profileImg;
  final String? gender;
  final DateTime? dob;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.isVerified,
    this.userType,
    this.email,
    this.addresses,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.phoneNumber,
    this.profileImg,
    this.gender,
    this.dob,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    isVerified: json["isVerified"],
    userType: json["userType"],
    email: json["email"],
    addresses: json["addresses"] == null ? [] : List<MyAddresses>.from(json["addresses"]!.map((x) => MyAddresses.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    phoneNumber: json["phoneNumber"],
    profileImg: json["profileImg"],
    gender: json["gender"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "isVerified": isVerified,
    "userType": userType,
    "email": email,
    "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "phoneNumber": phoneNumber,
    "profileImg": profileImg,
    "gender": gender,
    "dob": dob?.toIso8601String(),
  };
}

class MyAddresses {
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

  MyAddresses({
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

  factory MyAddresses.fromRawJson(String str) => MyAddresses.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyAddresses.fromJson(Map<String, dynamic> json) => MyAddresses(
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
