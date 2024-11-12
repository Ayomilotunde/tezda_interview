import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tezda_interview/network/dio_exception.dart';
import 'package:tezda_interview/services/navigation_service.dart';
import 'package:tezda_interview/services/secure_storage/secure_storage.dart';
import 'package:tezda_interview/utils/dialog.dart';
import 'package:tezda_interview/utils/next_screen.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:tezda_interview/utils/verification_success_dialog.dart';
import 'package:tezda_interview/views/home/home_base_view.dart';

import '../network/api/user/api_rep.dart';

class AuthProvider extends ChangeNotifier{
  final _apiRepo = ApiRepo();
  String? email;
  String? password;
  bool showPassword = false;
  bool showPassword2 = false;

  String? firstName;
  String? lastName;
  String? gender;
  DateTime? dob;
  String? confirmedPassword;
  String? phoneNumber;

  String errorMessage = "";

  Future<void> logIn(BuildContext context) async {
    try {
      // setProgressDialog();

      final response = await _apiRepo.loginUserApi(email, password);

      setSnackBar("Success", response.data['message']);

      await handleLoginResponse(
        response.data['token'],
        response.data['details']['firstName'],
        response.data['details']['lastName'],
        response.data['details']['phoneNumber'],
        response.data['details']['dob'],
        response.data['details']['gender'],
        response.data['details']['profileImg'],
      );

        nextScreenReplace(context, const HomeBaseView());
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      setSnackBar("Success", errorMessage);

      showDialog(
        context: context,
        builder: (context) {
          return CustomAlertDialog(
            title: "Login Error",
            content: errorMessage,
          );
        },
      );
    } finally{
      // Navigator.pop(context);
    }
  }

  Future<bool> createAccount() async {
    try {
      errorMessage = '';
      setProgressDialog();
      final response = await _apiRepo.createAccountApi(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName);
      final responseBody = response.data;
      var token = response.data['token'];
      await SecureStorage().saveToken(token: token ?? '');
      debugPrint(responseBody.toString());
      return true;
    } on DioException catch (e) {
      errorMessage = DioExceptions.fromDioError(e).toString();
      print(e.response);
      return false;
    } finally {
      Navigator.pop(currentContext!);
    }
  }

  Future<bool> verifyUser(BuildContext context, String otp) async {
    try {
      setProgressDialog();
      print(otp);
      final response = await _apiRepo.verifyAccountApi(otp: otp);
      setSnackBar("Success", response.data['message']);
      showVerificationDialog(currentContext!);

      return true;
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      print(e.response);
      // print(errorMessage);
      setSnackBar("Success", e.response!.data['message']);
      Navigator.of(context).pop();
      showDialog(
        context: currentContext!,
        builder: (context) {
          return CustomAlertDialog(
            title: "Verification Error",
            content: errorMessage,
          );
        },
      );
      return false;
    } finally {
      Navigator.pop(context);
    }
  }


  Future<void> handleLoginResponse(String? token, String? firstname, String? lastname, String? mobileNumber,
      String? dob, String? gender, String? image) async {

    await SecureStorage().loggedIn(isLogged: true);
    await SecureStorage().saveToken(token: token ?? '');
    await SecureStorage().saveUserFirsName(name: firstname ?? '');
    await SecureStorage().saveUserLastName(name: lastname ?? '');
    await SecureStorage().saveUserImagePath(imagePath: image ?? '');
    await SecureStorage().saveUserGender(name: gender ?? '');
    await SecureStorage().saveUserDOB(name: dob ?? '');
    await SecureStorage().saveUserMobileNumberName(name: mobileNumber ?? '');
  }
}