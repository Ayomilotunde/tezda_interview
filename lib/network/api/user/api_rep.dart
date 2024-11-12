import 'package:dio/dio.dart';
import 'package:tezda_interview/model/cart/add_cart.dart';
import 'package:tezda_interview/model/order/create_order.dart';
import 'package:tezda_interview/network/api/constants.dart';

import '../../dio_client.dart';

class ApiRepo {
  final DioClient dioClient = DioClient(Dio());

  // ApiRepo({required this.dioClient});

  Future<Response> createAccountApi({
    required String? email,
    String? firstName,
    String? lastName,
    required String? password,
  }) async {
    final Response response = await dioClient.post(
      ApiConstants.createAccount,
      data: {
        "email": email,
        "password": password,
        "userType": "regular", // regular or retailer
        "firstName": firstName ?? "", // optional
        "lastName": lastName ?? "", // optional
      },
    );
    return response;
  }

  Future<Response> loginUserApi(String? email, String? password) async {
    try {
      final Response response = await dioClient.post(
        ApiConstants.login,
        data: {"email": email, "password": password},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchAllProductApi({required String pageNumber, required String limit}) async {
    final Response response = await dioClient.get("${ApiConstants.fetchAllProducts}$pageNumber/$limit");
    return response;
  }

  Future<Response> fetchAProductApi(String id) async {
    // print("${ApiConstants.fetchAProduct}$id");
    final Response response = await dioClient.get("${ApiConstants.fetchAProduct}$id");
    return response;
  }

  Future<Response> fetchReviewsApi(String id) async {
    final Response response = await dioClient.get("${ApiConstants.fetchAllReviews}$id");
    return response;
  }

  Future<Response> fetchRatingsApi(String id) async {
    final Response response = await dioClient.get("${ApiConstants.fetchAllRatings}$id");
    return response;
  }

  Future<Response> verifyAccountApi({
    required String otp,
  }) async {
    try {
      final Response response = await dioClient.put(
        ApiConstants.verifyAccount,
        data: {
          "otp": otp,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }


  Future<Response> addReviewApi(
    String id, {
    required String title,
    required String comment,
    required int rating,
  }) async {
    final Response response = await dioClient
        .post("${ApiConstants.addReviews}$id", data: {"title": title, "comment": comment, "rating": rating});
    return response;
  }

  /*------------------ Favourite Api Call Start----------------*/

  Future<Response> addToFavouriteApi(String id) async {
    try {
      final Response response = await dioClient.put(
        ApiConstants.addToFavourite + id,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchFavouriteApi() async {
    try {
      final Response response = await dioClient.get(
        ApiConstants.viewFavourite,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> removeFavouriteItemApi(String id) async {
    try {
      final response = await dioClient.put(
        ApiConstants.removeFromFavourite + id,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

/*------------------ Favourite Api Call End----------------*/
}
