import 'package:flutter/material.dart';
import 'package:tezda_interview/model/user_profile.dart';

class UserProvider extends ChangeNotifier {
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? gender;
  DateTime? dob;
  String? confirmedPassword;
  String? phoneNumber;
  String? nin;
  String? referralCode;
  String? state;
  String? lga;
  String? adminReferral;
  UserProfile userProfile = UserProfile();
}
