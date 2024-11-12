import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._internal();
  late final FlutterSecureStorage storage;

  factory SecureStorage() {
    return _instance;
  }

  SecureStorage._internal() {
    storage = const FlutterSecureStorage();
  }

  Future<void> saveToken({required String token}) async {
    await storage.write(key: 'token', value: token);
  }

  Future<String?> retrieveToken() async {
    final token = await storage.read(key: 'token');
    return token;
  }

  Future<void> saveResetToken({required String resetToken}) async {
    await storage.write(key: 'reset_token', value: resetToken);
  }

  Future<String?> retrieveResetToken() async {
    final resetToken = await storage.read(key: 'reset_token');
    return resetToken;
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'token');
  }

  Future<void> saveUserId({required String userId}) async {
    await storage.write(key: 'userId', value: userId);
  }

  Future<String?> retrieveUserId() async {
    final userId = await storage.read(key: 'userId');
    return userId;
  }

  Future<void> saveUserLevel({required String level}) async {
    await storage.write(key: 'level', value: level);
  }

  Future<String?> retrieveUsrLevel() async {
    final level = await storage.read(key: 'level');
    return level;
  }

  Future<void> saveUserCurrentLevel({required String currentLevel}) async {
    await storage.write(key: 'currentLevel', value: currentLevel);
  }

  Future<String?> retrieveUsrCurrentLevel() async {
    final currentLevel = await storage.read(key: 'currentLevel');
    return currentLevel;
  }

  Future<void> saveUserDirectReferral({required String directReferral}) async {
    await storage.write(key: 'directReferral', value: directReferral);
  }

  Future<String?> retrieveUsrDirectReferral() async {
    final directReferral = await storage.read(key: 'directReferral');
    return directReferral;
  }

  Future<void> saveUserEmail({required String email}) async {
    await storage.write(key: 'email', value: email);
  }

  Future<String?> retrieveUsrEmail() async {
    final email = await storage.read(key: 'email');
    return email;
  }

  Future<void> saveUserFirsName({required String name}) async {
    await storage.write(key: 'firstname', value: name);
  }

  Future<String?> retrieveUsrFirsName() async {
    final name = await storage.read(key: 'firstname');
    return name;
  }

  Future<void> saveUserLastName({required String name}) async {
    await storage.write(key: 'lastname', value: name);
  }

  Future<String?> retrieveUsrLastName() async {
    final name = await storage.read(key: 'lastname');
    return name;
  }

  Future<void> saveUserMobileNumberName({required String name}) async {
    await storage.write(key: 'phoneNumber', value: name);
  }

  Future<String?> retrieveUsrMobileNumber() async {
    final name = await storage.read(key: 'phoneNumber');
    return name;
  }

  Future<void> saveUserDOB({required String name}) async {
    await storage.write(key: 'dob', value: name);
  }

  Future<String?> retrieveUserDOB() async {
    final name = await storage.read(key: 'dob');
    return name;
  }

  Future<void> saveUserGender({required String name}) async {
    await storage.write(key: 'gender', value: name);
  }

  Future<String?> retrieveUserGender() async {
    final name = await storage.read(key: 'gender');
    return name;
  }

  Future<void> saveUserReferralCode({required String referralCode}) async {
    await storage.write(key: 'referralCode', value: referralCode);
  }

  Future<String?> retrieveUsrReferralCode() async {
    final referralCode = await storage.read(key: 'referralCode');
    return referralCode;
  }

  Future<void> saveUserImagePath({required String imagePath}) async {
    await storage.write(key: 'imagePath', value: imagePath);
  }

  Future<String?> retrieveUsrImagePath() async {
    final imagePath = await storage.read(key: 'imagePath');
    return imagePath;
  }

  Future<void> saveUserType({required String userType}) async {
    await storage.write(key: 'userType', value: userType);
  }

  Future<String?> retrieveUserType() async {
    final userType = await storage.read(key: 'userType');
    return userType;
  }

  Future<void> saveiMartDescription({required String iMArtDescription}) async {
    await storage.write(key: 'iMArtDescription', value: iMArtDescription);
  }

  Future<String?> retrieveiMartDescription() async {
    final iMArtDescription = await storage.read(key: 'iMArtDescription');
    return iMArtDescription;
  }

  Future<void> saveiMartID({required String iMArtID}) async {
    await storage.write(key: 'iMArtID', value: iMArtID);
  }

  Future<String?> retrieveiMartID() async {
    final iMArtID = await storage.read(key: 'iMArtID');
    return iMArtID;
  }

  Future<void> saveUserPassword({required String password}) async {
    await storage.write(key: 'password', value: password);
  }

  Future<String?> retrieveUsrPassword() async {
    final password = await storage.read(key: 'password');
    return password;
  }

  Future<void> saveUserSpace({required String userStorage}) async {
    await storage.write(key: 'space', value: userStorage);
  }

  Future<String?> retrieveUsrSpace() async {
    final userStorage = await storage.read(key: 'space');
    return userStorage;
  }

  Future<void> biometricsEnabled({required bool enabled}) async {
    await storage.write(key: 'enabled', value: enabled.toString());
  }

  Future<bool?> retrieveBiometricsEnabled() async {
    final enabledString = await storage.read(key: 'enabled');

    final enabled =
        enabledString != null ? enabledString.toLowerCase() == 'true' : null;
    return enabled;
  }

  Future deleteBiometricsEnabled() async {
    await storage.delete(key: 'enabled');
  }

  Future<void> loggedIn({required bool isLogged}) async {
    await storage.write(key: 'isLogged', value: isLogged.toString());
  }

  Future<bool?> retrieveLoggedIn() async {
    final enabledString = await storage.read(key: 'isLogged');

    final isLogged =
        enabledString != null ? enabledString.toLowerCase() == 'true' : null;
    return isLogged;
  }

  Future<String?> getFingerPrint() async {
    final value = await storage.read(key: 'fingerPrint');
    return value;
  }

  void deleteFingerPrint() async {
    await storage.delete(key: 'fingerPrint');
  }

  void deleteBiometric() async {
    await storage.delete(key: 'enabled');
  }
}
