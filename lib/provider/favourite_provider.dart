import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tezda_interview/model/favourite/favourite.dart';
import 'package:tezda_interview/network/api/user/api_rep.dart';
import 'package:tezda_interview/network/dio_exception.dart';
import 'package:tezda_interview/utils/util_helpers.dart';

class FavouriteProvider extends ChangeNotifier{
  final _apiRepo = ApiRepo();
  String errorMessage = "";
  String successMessage = "";
  String productID = '';
  FavouriteResponse favourite = FavouriteResponse();


  Future<bool> addToFavourite() async {
    try {
      final response = await _apiRepo.addToFavouriteApi(productID);
      successMessage = response.data['message'];
      fetchFavourite();

      return true;
    } on DioException catch (e) {
      errorMessage = DioExceptions.fromDioError(e).toString();

      return false;
    }

  }

  Future<void> fetchFavourite() async {
    try {
      final response = await _apiRepo.fetchFavouriteApi();
      favourite = FavouriteResponse.fromJson(response.data);
    } on DioException catch (e) {
      errorMessage = DioExceptions.fromDioError(e).toString();
      setSnackBar("Favourite Error", errorMessage);
    }
    notifyListeners();

  }


  Future<bool> removeFromFavourite() async {
    try {
      // setProgressDialog();
      final response = await _apiRepo.removeFavouriteItemApi(productID);
      await fetchFavourite();
      successMessage = response.data['message'];

      return true;
    } on DioException catch (e) {
      errorMessage = DioExceptions.fromDioError(e).toString();

      return false;
    }
  }

}