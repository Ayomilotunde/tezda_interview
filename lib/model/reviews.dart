// To parse this JSON data, do
//
//     final reviews = reviewsFromJson(jsonString);

import 'dart:convert';

Reviews reviewsFromJson(String str) => Reviews.fromJson(json.decode(str));

String reviewsToJson(Reviews data) => json.encode(data.toJson());

class Reviews {
  final bool? success;
  final Data? data;

  Reviews({
    this.success,
    this.data,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  final List<Review>? reviews;
  final int? totalReviews;
  final int? currentPage;
  final int? totalPages;

  Data({
    this.reviews,
    this.totalReviews,
    this.currentPage,
    this.totalPages,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
        totalReviews: json["totalReviews"],
        currentPage: json["currentPage"],
        totalPages: json["totalPages"],
      );

  Map<String, dynamic> toJson() => {
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "totalReviews": totalReviews,
        "currentPage": currentPage,
        "totalPages": totalPages,
      };
}

class Review {
  final String? id;
  final User? user;
  final int? v;
  final String? comment;
  final int? rating;
  final String? title;
  final DateTime? updatedAt;

  Review({
    this.id,
    this.user,
    this.v,
    this.comment,
    this.rating,
    this.title,
    this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        v: json["__v"],
        comment: json["comment"],
        rating: json["rating"],
        title: json["title"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user?.toJson(),
        "__v": v,
        "comment": comment,
        "rating": rating,
        "title": title,
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class User {
  final String? id;
  final String? firstName;
  final String? lastName;

  User({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
