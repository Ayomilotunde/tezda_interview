import 'dart:convert';

class Referral {
  final bool? success;
  final String? message;
  final String? refCode;

  Referral({
    this.success,
    this.message,
    this.refCode,
  });

  factory Referral.fromRawJson(String str) => Referral.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Referral.fromJson(Map<String, dynamic> json) => Referral(
        success: json["success"],
        message: json["message"],
        refCode: json["refCode"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "refCode": refCode,
      };
}
