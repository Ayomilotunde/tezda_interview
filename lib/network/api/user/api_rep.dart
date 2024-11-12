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
    required String? phoneNumber,
    required String? nin,
    required String? gender,
    required String? state,
    required String? lga,
    required String? password,
    required String? adminReferral,
  }) async {
    final Response response = await dioClient.post(
      ApiConstants.createAccount,
      data: {
        "email": email,
        "password": password,
        "userType": "retailer", // regular or retailer
        "firstName": firstName ?? "", // optional
        "lastName": lastName ?? "", // optional
        "phoneNumber": phoneNumber, // optional, based on userType
        "nin": nin,
        "gender": gender,
        "state": state,
        "localGovt": lga,
        "adminReferral": adminReferral ?? ""
      },
    );
    return response;
  }

  Future<Response> updateTokenApi({
    required String token,
  }) async {
    try {
      final Response response = await dioClient.post(
        ApiConstants.updateToken,
        data: {
          "token": token,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
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

  Future<Response> forgotPasswordApi({
    required String email,
  }) async {
    try {
      final Response response = await dioClient
          .put(ApiConstants.forgotPassword, data: {"email": email});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> resetPasswordApi({
    required String otp,
    required String newPassword,
  }) async {
    try {
      final Response response = await dioClient.put(ApiConstants.resetPassword,
          data: {"otp": otp, "newPassword": newPassword});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getReferralCodeApi() async {
    final Response response = await dioClient.get(
      ApiConstants.getReferralCode,
    );
    return response;
  }

  Future<Response> verifyReferralCodeApi({
    required String code,
  }) async {
    try {
      final Response response = await dioClient.get(
        ApiConstants.verifyReferralCode + code,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> resendOTPApi() async {
    try {
      final Response response = await dioClient.get(
        ApiConstants.resendOTP,
      );
      return response;
    } catch (e) {
      rethrow;
    }
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

  Future<Response> updateUserProfileApi({
    required String? firstName,
    required String? lastName,
    required String? gender,
    required DateTime? dob,
  }) async {
    try {
      final Response response = await dioClient.put(
        ApiConstants.updateProfile,
        data: {
          "newDetails": {
            "firstName": firstName ?? "",
            "lastName": lastName ?? "",
            "gender": gender ?? "", // male or female
            "dob": "${dob ?? ""}"
          }
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateUserPasswordApi({
    required String? oldPassword,
    required String? newPassword,
  }) async {
    try {
      final Response response = await dioClient.put(
        ApiConstants.updatePassword,
        data: {"oldPassword": oldPassword, "newPassword": newPassword},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getUserProfileApi() async {
    final Response response = await dioClient.get(ApiConstants.profile);
    return response;
  }

  Future<Response> getSlidersApi() async {
    final Response response = await dioClient.get(ApiConstants.slider);
    return response;
  }

  Future<Response> getWalletBalanceApi() async {
    final Response response = await dioClient.get(ApiConstants.walletBalance);
    return response;
  }

  Future<Response> fetchAllProductApi(
      {required String pageNumber, required String limit}) async {
    final Response response = await dioClient
        .get("${ApiConstants.fetchAllProducts}$pageNumber/$limit");
    return response;
  }

  Future<Response> fetchFlashSalesProductApi(
      {required String pageNumber, required String limit}) async {
    final Response response = await dioClient
        .get("${ApiConstants.fetchFlashSalesProduct}/$pageNumber/$limit");
    return response;
  }

  Future<Response> fetchAProductApi(String id) async {
    // print("${ApiConstants.fetchAProduct}$id");
    final Response response =
        await dioClient.get("${ApiConstants.fetchAProduct}$id");
    return response;
  }

  Future<Response> fetchReviewsApi(String id) async {
    final Response response =
        await dioClient.get("${ApiConstants.fetchAllReviews}$id");
    return response;
  }

  Future<Response> fetchRatingsApi(String id) async {
    final Response response =
        await dioClient.get("${ApiConstants.fetchAllRatings}$id");
    return response;
  }

  Future<Response> addReviewApi(
    String id, {
    required String title,
    required String comment,
    required int rating,
  }) async {
    final Response response = await dioClient.post(
        "${ApiConstants.addReviews}$id",
        data: {"title": title, "comment": comment, "rating": rating});
    return response;
  }

  Future<Response> estimatedPriceApi() async {
    try {
      final response = await dioClient.get(ApiConstants.cartEstimatedPrice);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /*------------------ Cart Api Call Start----------------*/

  Future<Response> addToCartApi(CartItem cartItem) async {
    try {
      final Response response = await dioClient.post(
        ApiConstants.addToCart,
        data: cartItem.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchCartApi() async {
    try {
      final Response response = await dioClient.get(
        ApiConstants.viewCart,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future removeCartItemApi(String id) async {
    try {
      final response = await dioClient.delete(
        ApiConstants.removeFromCart + id,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future clearCartItemsApi() async {
    try {
      final response = await dioClient.delete(ApiConstants.clearCart);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /*------------------ Cart Api Call End----------------*/

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

  Future<Response> fetchCategoriesApi(
      {required String pageNumber, required String limit}) async {
    try {
      final Response response = await dioClient.get(
        "${ApiConstants.getCategories}$pageNumber/$limit",
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchCategoryProductsApi(
      {required String page,
      required String categoryID,
      required String limit}) async {
    try {
      final Response response = await dioClient.get(
        "${ApiConstants.searchProductByCategory}$categoryID/$page/$limit",
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchSearchedProductsApi(
      {required String page,
      required String name,
      required String limit}) async {
    try {
      final Response response = await dioClient.get(
        "${ApiConstants.searchProductByName}$name/$page/$limit",
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> addUserAddressApi({
    required String firstname,
    required String lastname,
    required String street,
    required String state,
    required String lga,
    required String city,
    required String direction,
    required String phoneNumber,
  }) async {
    try {
      final Response response =
          await dioClient.put(ApiConstants.addUserAddress, data: {
        "firstName": firstname,
        "lastName": lastname,
        "streetAdd": street,
        "state": state,
        "localGovt": lga,
        "city": city,
        "direction": direction,
        "phoneNumber": phoneNumber
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchUserAddressesApi() async {
    try {
      final Response response = await dioClient.get(
        ApiConstants.getUserAddress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateActiveAddressesApi(String addressID) async {
    try {
      final Response response = await dioClient.put(
        ApiConstants.updateActiveAddress + addressID,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchLocationsByLGAApi(String lga) async {
    // print("${ApiConstants.getPickupLocationByLGA}$lga");
    final Response response =
        await dioClient.get("${ApiConstants.getPickupLocationByLGA}$lga");
    return response;
  }

  Future<Response> removeUserAddressesApi(String id) async {
    try {
      final Response response = await dioClient.delete(
        "${ApiConstants.removeUserAddress}/$id",
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /*------------------ Order Api Call Start----------------*/

  Future<Response> newOrderApi(OrderData order) async {
    try {
      final Response response = await dioClient.post(
        ApiConstants.order,
        data: order.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchOrderHistoryApi() async {
    try {
      final Response response = await dioClient.get(
        ApiConstants.orderHistory,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> cancelOrderApi(String orderID) async {
    try {
      final Response response = await dioClient.put(
          "${ApiConstants.cancelOrder}$orderID/status/user",
          data: {"status": "cancelled"});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchOrderDetailsApi(String id) async {
    try {
      final Response response = await dioClient.get(
        ApiConstants.orderDetails + id,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> fetchVoucherDetailsApi(String code) async {
    try {
      final Response response = await dioClient.get(
        ApiConstants.voucherDetails + code,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

/*------------------ Order Api Call End----------------*/

  Future<Response> paymentApi({
    required String? paymentMethod,
    required String? deliveryOption,
    required String? voucher,
  }) async {
    try {
      final Response response = await dioClient.post(
        ApiConstants.initiatePayment,
        data: {
          // "orderId": orderID,
          // "currency": "NGN"
          "currency": "NGN",
          "voucher": voucher ?? "",
          "paymentMethod": paymentMethod ?? "cash", // cash or online
          "deliveryOption": deliveryOption ?? "pickup" // pickup or door
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
