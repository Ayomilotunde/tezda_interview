import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tezda_interview/model/favourite/favourite.dart';
import 'package:tezda_interview/model/product_response.dart';
import 'package:tezda_interview/model/ratings.dart';
import 'package:tezda_interview/model/reviews.dart';
import 'package:tezda_interview/model/single_product.dart';
import 'package:tezda_interview/network/api/user/api_rep.dart';
import 'package:tezda_interview/utils/util_helpers.dart';

import '../network/dio_exception.dart';

class ProductProvider extends ChangeNotifier{
  Products products = Products();
  Product product = Product();
  String productID = '';
  FavouriteResponse favourite = FavouriteResponse();
  final _apiRepo = ApiRepo();
  Reviews reviews = Reviews();
  Rating ratings = Rating();
  SingleProduct singleProduct = SingleProduct();

  String pageNumber = "1";
  String limit = "20";

  String errorMessage = "";
  String successMessage = "";

  final String image = "https://img.freepik.com/free-photo/psychological-therapy-support-group-meeting_23-2151044467.jpg?t=st=1731386403~exp=1731390003~hmac=619c455064fc291dfd26df62eb992ef176179378c978d274890f0449813498f6&w=2000";

  Future<void> fetchAllProducts() async {
    try {

      final response = await _apiRepo.fetchAllProductApi(pageNumber: pageNumber, limit: limit);
      final responseBody = response.data;
      print(responseBody);

      products = Products.fromJson(responseBody);

    } on DioException catch (e) {
      errorMessage = DioExceptions.fromDioError(e).toString();

      setSnackBar("Product Error", errorMessage);
    }
    notifyListeners();
  }



  Future<void> fetchReviews() async {
    try {
      errorMessage = '';
      final response = await _apiRepo.fetchReviewsApi(productID);
      final responseBody = response.data;

      reviews = Reviews.fromJson(responseBody);
    } on DioException catch (e) {
      errorMessage = DioExceptions.fromDioError(e).toString();
      setSnackBar("Review Error", errorMessage);
    }
    notifyListeners();
  }

  Future<void> fetchRatings() async {
    try {
      errorMessage = '';
      final response = await _apiRepo.fetchRatingsApi(productID);
      final responseBody = response.data;

      ratings = Rating.fromJson(responseBody);
    } on DioException catch (e) {
      errorMessage = DioExceptions.fromDioError(e).toString();
      setSnackBar("Rating Error", errorMessage);
    }
    notifyListeners();
  }

  Future<void> fetchAProducts() async {
    try {
      final response = await _apiRepo.fetchAProductApi(productID);
      fetchRatings();
      fetchReviews();

      singleProduct = SingleProduct.fromJson(response.data);
    } on DioException catch (e) {
      errorMessage = DioExceptions.fromDioError(e).toString();
      setSnackBar("Error", errorMessage);
    }
    notifyListeners();

  }

}