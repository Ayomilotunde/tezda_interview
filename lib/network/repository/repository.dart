//
// import '../api/user/api_rep.dart';
// import '../dio_exception.dart';
//
// class UserRepository {
//   final UserApi userApi;
//
//   UserRepository(this.userApi);
//   final UserProvider userProvider = UserProvider();
//
//   Future<LoginResponse> logUserInRequested({
//     required String name,
//     required String password,
//   }) async {
//     try {
//       loader();
//       Response response = await userApi.loginUserApi(name, password);
//
//       var loginData = LoginResponse.fromJson(response.data);
//       await Auth()
//           .signInWithEmailAndPassword(email: name, password: "1234567890");
//       // Save login state
//       await SecureStorage().loggedIn(isLogged: true);
//       await SecureStorage().saveToken(token: loginData.token.toString());
//       await SecureStorage()
//           .saveUserType(userType: loginData.userType ?? "user");
//
//       await getUsersProfileRequested();
//
//       // Stop the loading bar
//       Navigator.pop(currentContext!);
//
//       // Display success message
//       showToast(
//           message: loginData.message.toString(), color: Colors.greenAccent);
//
//       if (loginData.userType == "partner") {
//         nextScreenReplace(currentContext, const PartnerLandingScreen());
//       } else {
//         // Navigate to new screen
//         nextScreenReplace(currentContext, const LandingScreen());
//       }
//
//       return loginData;
//     } on DioError catch (e) {
//       Navigator.pop(currentContext!);
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<SignUpResponse> createUserInRequested({
//     required String email,
//     String? firstName,
//     String? lastName,
//     required String nickName,
//     required String phoneNumber,
//     required String dob,
//     required String country,
//     required String state,
//     required String city,
//     required String address,
//     required String password,
//     required String confirmPassword,
//     required String type,
//     String? place,
//     String? eventPlaceName,
//     String? eventPlaceAbout,
//   }) async {
//     try {
//       loader();
//       Response response = await userApi.createAccountApi(
//           email: email,
//           firstName: firstName ?? '',
//           lastName: lastName ?? '',
//           nickName: nickName,
//           phoneNumber: phoneNumber,
//           dob: dob,
//           country: country,
//           state: state,
//           city: city,
//           address: address,
//           password: password,
//           confirmPassword: confirmPassword,
//           type: type,
//           eventPlaceAbout: eventPlaceAbout,
//           eventPlaceName: eventPlaceName,
//           place: place);
//       var signUp = SignUpResponse.fromJson(response.data);
//       await currentContext!.read<UserProvider>().createAccount(
//           email: email,
//           firstName: firstName ?? eventPlaceName.toString(),
//           lastName: lastName ?? eventPlaceName.toString(),
//           nickName: nickName,
//           phoneNumber: phoneNumber,
//           dob: dob,
//           country: country,
//           state: state,
//           city: city,
//           userID: signUp.userId!);
//       Navigator.pop(currentContext!);
//       showToast(message: signUp.message.toString(), color: Colors.greenAccent);
//       nextScreen(currentContext, VerificationPage(email: email));
//       return signUp;
//     } on DioError catch (e) {
//       Navigator.pop(currentContext!);
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<dynamic> updateUserRequested({
//     required String firstName,
//     required String lastName,
//     required String nickName,
//     required String phoneNumber,
//     required String dob,
//     required String country,
//     required String state,
//     required String city,
//     required String address,
//   }) async {
//     try {
//       loader();
//       Response response = await userApi.updateAccountApi(
//         firstName: firstName,
//         lastName: lastName,
//         nickName: nickName,
//         phoneNumber: phoneNumber,
//         dob: dob,
//         country: country,
//         state: state,
//         city: city,
//         address: address,
//       );
//       var update = response.data;
//       Navigator.pop(currentContext!);
//       showToast(
//           message: update["message"].toString(), color: Colors.greenAccent);
//       getUsersProfileRequested();
//       nextScreenReplace(currentContext, const LandingScreen());
//       return update;
//     } on DioError catch (e) {
//       Navigator.pop(currentContext!);
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<dynamic> updateUserTokenRequested({
//     required String token,
//   }) async {
//     try {
//       Response response = await userApi.updateTokenApi(token: token);
//       var update = response.data;
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<dynamic> verifyAccountRequested({
//     required String otp,
//   }) async {
//     loader();
//     try {
//       Response response = await userApi.verifyAccountApi(otp: otp);
//       var update = response.data;
//       showToast(message: update['message'], color: Colors.greenAccent);
//       nextScreenReplace(currentContext, WelcomeScreen());
//     } on DioError catch (e) {
//       Navigator.pop(currentContext!);
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<dynamic> resendOTPRequested({
//     required String email,
//   }) async {
//     loader();
//     try {
//       Response response = await userApi.resendOTPApi(email: email);
//       var update = response.data;
//       Navigator.pop(currentContext!);
//     } on DioError catch (e) {
//       Navigator.pop(currentContext!);
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<ProfileResponse> getUsersProfileRequested() async {
//     try {
//       final response = await userApi.getUserProfileApi();
//       final profile = ProfileResponse.fromJson(response.data);
//       userProvider.profile = profile;
//       print(profile.user?.user);
//       await SecureStorage()
//           .saveUserType(userType: profile.user?.user ?? "user");
//       currentContext!
//           .read<UserProvider>()
//           .getUserDataFromFirestore(profile.user!.id.toString());
//       return profile;
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<PlansResponse> getSubscriptionListRequested() async {
//     try {
//       final response = await userApi.getSubscriptionListApi();
//       final plans = PlansResponse.fromJson(response.data);
//       return plans;
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<FriendsResponse> getRandomSuggestedFriendsRequested() async {
//     try {
//       final response = await userApi.getRandomSuggestedFriendsApi();
//       final randomSuggestedFriendResponse =
//           FriendsResponse.fromJson(response.data);
//       return randomSuggestedFriendResponse;
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       // showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<FriendsResponse> getMonthlySuggestedFriendsRequested(
//       {required String month}) async {
//     try {
//       final response =
//           await userApi.getDOBMonthSuggestedFriendsApi(month: month);
//       final monthlySuggestedFriendResponse =
//           FriendsResponse.fromJson(response.data);
//       return monthlySuggestedFriendResponse;
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       // showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<FriendsResponse> getDOBSuggestedFriendsRequested(
//       {required String month}) async {
//     try {
//       final response = await userApi.getDOBSuggestedFriendsApi(month: month);
//       final monthlySuggestedFriendResponse =
//           FriendsResponse.fromJson(response.data);
//       return monthlySuggestedFriendResponse;
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<FriendsResponse> getMyFriendRequestsRequested() async {
//     try {
//       final response = await userApi.getFriendRequestApi();
//       final friendResponse = FriendsResponse.fromJson(response.data);
//       return friendResponse;
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<FriendsResponse> getMySentFriendRequestsRequested() async {
//     try {
//       final response = await userApi.getSentFriendRequestApi();
//       final friendResponse = FriendsResponse.fromJson(response.data);
//       return friendResponse;
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<FriendsResponse> getMyFriendsRequested() async {
//     try {
//       final response = await userApi.getFriendsRequestApi();
//       final friendResponse = FriendsResponse.fromJson(response.data);
//       return friendResponse;
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       throw errorMessage;
//     }
//   }
//
//   Future<dynamic> sendFriendRequested({required String uid}) async {
//     try {
//       final response = await userApi.sendFriendRequestApi(uid: uid);
//
//       showToast(message: response.data['message'], color: Colors.greenAccent);
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       Navigator.of(currentContext!).pop();
//       throw errorMessage;
//     }
//   }
//
//   Future<dynamic> acceptFriendRequested({required String uid}) async {
//     try {
//       final response = await userApi.acceptFriendRequestApi(uid: uid);
//       showToast(message: response.data['message'], color: Colors.greenAccent);
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       // Navigator.of(currentContext!).pop();
//       throw errorMessage;
//     }
//   }
//
//   Future<dynamic> rejectFriendRequested({required String uid}) async {
//     try {
//       final response = await userApi.rejectFriendRequestApi(uid: uid);
//       showToast(message: response.data['message'], color: Colors.greenAccent);
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       showFailToast(message: errorMessage);
//       // Navigator.of(currentContext!).pop();
//       throw errorMessage;
//     }
//   }
// }
