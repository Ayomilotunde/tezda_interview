// To parse this JSON data, do
//
//     final initiatePaymentResponse = initiatePaymentResponseFromJson(jsonString);

import 'dart:convert';

InitiatePaymentResponse initiatePaymentResponseFromJson(String str) => InitiatePaymentResponse.fromJson(json.decode(str));

String initiatePaymentResponseToJson(InitiatePaymentResponse data) => json.encode(data.toJson());

class InitiatePaymentResponse {
  final bool? success;
  final Response? response;

  InitiatePaymentResponse({
    this.success,
    this.response,
  });

  factory InitiatePaymentResponse.fromJson(Map<String, dynamic> json) => InitiatePaymentResponse(
    success: json["success"],
    response: json["paymentResponse"] == null ? null : Response.fromJson(json["paymentResponse"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "response": response?.toJson(),
  };
}

class Response {
  final bool? requestSuccessful;
  final String? responseCode;
  final String? responseMessage;
  final ResponseBody? responseBody;

  Response({
    this.requestSuccessful,
    this.responseCode,
    this.responseMessage,
    this.responseBody,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    requestSuccessful: json["requestSuccessful"],
    responseCode: json["responseCode"],
    responseMessage: json["responseMessage"],
    responseBody: json["responseBody"] == null ? null : ResponseBody.fromJson(json["responseBody"]),
  );

  Map<String, dynamic> toJson() => {
    "requestSuccessful": requestSuccessful,
    "responseCode": responseCode,
    "responseMessage": responseMessage,
    "responseBody": responseBody?.toJson(),
  };
}

class ResponseBody {
  final String? paymentReference;
  final String? transactionReference;
  final String? checkoutUrl;

  ResponseBody({
    this.paymentReference,
    this.transactionReference,
    this.checkoutUrl,
  });

  factory ResponseBody.fromJson(Map<String, dynamic> json) => ResponseBody(
    paymentReference: json["paymentReference"],
    transactionReference: json["transactionReference"],
    checkoutUrl: json["checkoutUrl"],
  );

  Map<String, dynamic> toJson() => {
    "paymentReference": paymentReference,
    "transactionReference": transactionReference,
    "checkoutUrl": checkoutUrl,
  };
}
