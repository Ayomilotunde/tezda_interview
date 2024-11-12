// To parse this JSON data, do
//
//     final rating = ratingFromJson(jsonString);

import 'dart:convert';

Rating ratingFromJson(String str) => Rating.fromJson(json.decode(str));

String ratingToJson(Rating data) => json.encode(data.toJson());

class Rating {
  final bool? success;
  final Data? data;

  Rating({
    this.success,
    this.data,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  final int? the1;
  final int? the2;
  final int? the3;
  final int? the4;
  final int? the5;

  Data({
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.the5,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        the1: json["1"],
        the2: json["2"],
        the3: json["3"],
        the4: json["4"],
        the5: json["5"],
      );

  Map<String, dynamic> toJson() => {
        "1": the1,
        "2": the2,
        "3": the3,
        "4": the4,
        "5": the5,
      };
}
