import 'dart:convert';

class WalletBalance {
  final bool? success;
  final String? message;
  final int? balance;

  WalletBalance({
    this.success,
    this.message,
    this.balance,
  });

  factory WalletBalance.fromRawJson(String str) => WalletBalance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory WalletBalance.fromJson(Map<String, dynamic> json) => WalletBalance(
        success: json["success"],
        message: json["message"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "balance": balance,
      };
}
