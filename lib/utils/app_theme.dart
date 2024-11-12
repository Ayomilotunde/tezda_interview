import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AppTheme {
  //AppTheme._();

  static Color get bottonNavbarCustomColor =>
      getColorBasedOnTheme(AppTheme.white, AppTheme.bottomNavBlack);

  static Color get regText =>
      getColorBasedOnTheme(const Color(0xFF3F434A), Colors.grey);

  static Color get containerCustomColor =>
      getColorBasedOnTheme(AppTheme.white, AppTheme.bottomNavBlack);

  static Color get appBarTitle =>
      getColorBasedOnTheme(AppTheme.white, Colors.grey);

  static Color get iconColor =>
      getColorBasedOnTheme(Colors.grey, AppTheme.transparent);

  static Color get appbaText =>
      getColorBasedOnTheme(AppTheme.neutralBlack, Colors.grey);

  static Color getColorBasedOnTheme(Color lightColor, Color darkColor) {
    final currentTheme = Get.theme;
    final isDarkMode = currentTheme.brightness == Brightness.dark;

    return isDarkMode ? darkColor : lightColor;
  }

  // Primary Colour 30%
  static const MaterialColor primary = MaterialColor(0xFF2BA2DA, {
    900: Color(0xFF061921),
    800: Color(0xFF0A2836),
    700: Color(0xFF15516D),
    600: Color(0xFF2079A3),
    500: Color(0xFF2BA2DA),
    400: Color(0xFF60B9E3),
    300: Color(0xFF95D0EC),
    200: Color(0xFFCAE7F5),
    100: Color(0xFFEDF7FB),
    50: Color(0x00EDF7FB),
  });

  // Base Colour 60%
  static const MaterialColor grey = MaterialColor(0xFF212121, {
    900: Color(0xFF19191A),
    800: Color(0xFF373637),
    700: Color(0xFF515050),
    600: Color(0xFF696869),
    500: Color(0xFF7F7E7E),
    400: Color(0xFF949493),
    300: Color(0xFFA8A8A7),
    200: Color(0xFFBCBCBB),
    100: Color(0xFFD0D0D0),
  });

  // Secondary Colour 10%
  static const MaterialColor secondary = MaterialColor(0xFF364273, {
    900: Color(0xFF080A11),
    800: Color(0xFF0D101C),
    700: Color(0xFF1B2139),
    600: Color(0xFF283156),
    500: Color(0xFF364273),
    400: Color(0xFF687196),
    300: Color(0xFF9AA0B9),
    200: Color(0xFFCCCFDC),
    100: Color(0xFFEEEFF3),
  });

  static const MaterialColor accent = MaterialColor(0xFFF1CC50, {
    900: Color(0xFF251F0C),
    800: Color(0xFF3C3314),
    700: Color(0xFF786628),
    600: Color(0xFFB4993C),
    500: Color(0xFFF1CC50),
    400: Color(0xFFF4D87B),
    300: Color(0xFFF8E5A7),
    200: Color(0xFFFBF2D3),
    100: Color(0xFFFDFAF0),
  });

  static const MaterialColor success = MaterialColor(0xFF3EE067, {
    900: Color(0xFF0B6B49),
    800: Color(0xFF13814F),
    700: Color(0xFF1FA159),
    600: Color(0xFF2DC060),
    500: Color(0xFF3EE067),
    400: Color(0xFF6CEC80),
    300: Color(0xFF8BF591),
    200: Color(0xFFB5FBB3),
    100: Color(0xFFDDFDD8),
    50: Color(0xFFECFDF3),
  });

  static const MaterialColor warning = MaterialColor(0xFFFFD11C, {
    900: Color(0xFF7A5805),
    800: Color(0xFF936E08),
    700: Color(0xFFB78E0E),
    600: Color(0xFFDBAE14),
    500: Color(0xFFFFD11C),
    400: Color(0xFFFFE054),
    300: Color(0xFFFFE976),
    200: Color(0xFFFFF2A4),
    100: Color(0xFFFFF9D1),
  });

  static const MaterialColor error = MaterialColor(0xFFFF3D46, {
    900: Color(0xFF7A0B38),
    800: Color(0xFF93133B),
    700: Color(0xFFB71E41),
    600: Color(0xFFDB2C44),
    500: Color(0xFFFF3D46),
    400: Color(0xFFFF736D),
    300: Color(0xFFFF998A),
    200: Color(0xFFFFC2B1),
    100: Color(0xFFFFE4D8),
  });

  static const MaterialColor information = MaterialColor(0xFF59AEFF, {
    900: Color(0xFF11317A),
    800: Color(0xFF1C4793),
    700: Color(0xFF2C65B7),
    600: Color(0xFF4188DB),
    500: Color(0xFF59AEFF),
    400: Color(0xFF82C8FF),
    300: Color(0xFF9BD8FF),
    200: Color(0xFFBCE8FF),
    100: Color(0xFFDDF5FF),
  });

  static TextTheme textTheme = TextTheme(
    displayLarge: display2xlRegular,
    displayMedium: displayXlRegular,
    displaySmall: displayLgRegular,
    headlineLarge: displayMdRegular,
    headlineMedium: displaySmRegular,
    bodyLarge: textLgRegular,
    bodyMedium: textMdRegular,
    bodySmall: textSmRegular,
  );

  // Fonts
  // static const String fontName = 'Outfit';
  static const String fontName = 'Roboto';

  // Display 2xl Text Themes
  static const TextStyle display2xlRegular = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle display2xlMedium = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 32,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle display2xlSemiBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 32,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle display2xlBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 32,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  // Display xl Text Themes
  static const TextStyle displayXlRegular = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 28,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle displayXlMedium = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 28,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle displayXlSemiBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 28,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle displayXlBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  //Display large Text Themes
  static const TextStyle displayLgRegular = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle displayLgMedium = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 24,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle displayLgSemiBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 24,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle displayLgBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  //Display medium Text Themes
  static const TextStyle displayMdRegular = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle displayMdMedium = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 20,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static TextStyle displayMdSemiBold = const TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 1.2,
    //color: AppTheme.appbaText,
  );

  static const TextStyle displayMdBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  //Display small Text Themes
  static const TextStyle displaySmRegular = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 18,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle displaySmMedium = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle displaySmSemiBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1.2,
    color: Colors.grey,
  );

  static const TextStyle displaySmBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 18,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  //Text Large Text Themes
  static TextStyle textLgRegular = const TextStyle(
      fontFamily: fontName,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      height: 1.2,
      color: Colors.grey);

  static const TextStyle textLgMedium = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.2,
    color: Colors.grey,
  );

  static const TextStyle textLgSemiBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle textLgBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  //Text Medium Text Themes
  static const TextStyle textMdRegular = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static TextStyle textMdMedium = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.2,
    color: AppTheme.grey[500],
  );

  static TextStyle textMdSemiBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 1.2,
    color: AppTheme.grey[700],
  );

  static const TextStyle textMdBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  //Text Small Text Themes
  static const TextStyle textSmRegular = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.2,
    color: Colors.grey,
  );

  static const TextStyle textSmMedium = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle textSmSemiBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  static const TextStyle textSmBold = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 1.2,
    color: Color(0xFF3F434A),
  );

  // Primary Colors
  // static const Color primaryColor = Color(0xFF013334);

  static const Color primaryColor = Color(0xFF90C326);

  // static const Color primaryColor = Color(0xFF2BA2DA);

  // Secondary Colors
  static const Color secondaryColor = Color(0xFF364273);

  static const Color darkBgColor = Color(0xFF101828);

  // Transparent
  static const Color transparent = Color(0x00FFFFFF);

  // Border
  static const Color border = Color(0xFFBBBBBB);

  // Alert Colors
  static const Color alertSuccess = Color(0xFF4ADE80);
  static const Color noticeBackground = Color(0xFFEDF6DB);
  static const Color alertInfo = Color(0xFF246BFD);
  static const Color alertWarning = Color(0xFFFACC15);
  static const Color alertError = Color(0xFFF75555);
  static const Color alertDisabled = Color(0xFFD8D8D8);
  static const Color alertDisButton = Color(0xFF476EBE);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFFFF3300),
      Color(0xFFFF0055),
    ],
  );
  static const LinearGradient gradientSunSetOrange = LinearGradient(
    colors: [
      Color(0xFFFF8285),
      Color(0xFFFF575C),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0, 1],
  );
  static const LinearGradient gradientPurple = LinearGradient(
    colors: [
      Color(0xFF896BFF),
      Color(0xFF6842FF),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0, 1],
  );
  static const LinearGradient gradientGreen = LinearGradient(
    colors: [
      Color(0xFF39E180),
      Color(0xFF1AB65C),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0, 1],
  );
  static const LinearGradient gradientYellow = LinearGradient(
    colors: [
      Color(0xFFFFE580),
      Color(0xFFFACC15),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0, 1],
  );

  // Dark Colors
  static const Color darkest = Color(0xFF181A20);
  static const Color darker = Color(0xFF1F222A);
  static const Color dark = Color(0xFF35383F);

  // General Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFF54336);
  static const Color sunsetOrange = Color(0xFFFF575C);
  static const Color sunsetOrangeLight = Color(0xFFFF8285);
  static const Color pink = Color(0xFFE91E63);
  static const Color purple = Color(0xFF9C27B0);
  static const Color deepPurple = Color(0xFF673AB7);
  static const Color indigo = Color(0xFF3F51B5);
  static const Color blue = Color(0xFF2196F3);
  static const Color lightBlue = Color(0xFF03A9F4);
  static const Color cyan = Color(0xFF00BCD4);
  static const Color teal = Color(0xFF009688);
  static const Color green = Color(0xFF4CAF50);
  static const Color deepGreen = Color(0xFF077825);
  static const Color deeperGreen = Color(0xFF013334);
  static const Color lightGreen = Color(0xFF8BC34A);
  static const Color lime = Color(0xFFCDDC39);
  static const Color yellow = Color(0xFFFFEB3B);
  static const Color amber = Color(0xFFFFC107);
  static const Color orange = Color(0xFFFF9800);
  static const Color deepOrange = Color(0xFFFF5722);
  static const Color brown = Color(0xFF795548);
  static const Color blueGrey = Color(0xFF607D8B);
  static const Color bottomNavBlack = Color(0xFF0D1017);
  static const Color fieldIconColor = Color(0xFF130F26);
  static const Color darkTextColor = Color(0xFF4F4F4F);
  static const Color greyTextColor = Color(0xFF1E1E1E);
  static const Color interestTextColor = Color(0xFF4E4C4C);
  static const Color neutralBlack = Color(0xFF030319);

  // Categories Colors
  static const Color laptopBackground = Color(0xFF00A1FF);
  static const Color phoneBackground = Color(0xFFE875AE);
  static const Color watchBackground = Color(0xFF549BFF);
  static const Color chargerBackground = Color(0xFF892BE0);

  // Background Colors
  static const Color backgroundGreen = Color(0xFFF7FFFA);
  static const Color backgroundBlue = Color(0xFFF6FAFD);
  static const Color backgroundPink = Color(0xFFFFF5F5);
  static const Color backgroundYellow = Color(0xFFFFFEE0);
  static const Color backgroundPurple = Color(0xFFFCF4FF);
  static const Color backgroundNotificationGreen = Color(0xFFEFF8D9);
}

final baseLight = ThemeData.light();

ThemeData darkTheme = baseLight.copyWith(
  brightness: Brightness.dark,
  primaryColor: AppTheme.primaryColor,
  scaffoldBackgroundColor: AppTheme.black,
  textTheme: Get.textTheme.apply(
    displayColor: Colors.white, // Text color for dark theme
    bodyColor: Colors.white70, // Text color for dark theme
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: AppTheme.textMdRegular.copyWith(color: AppTheme.grey[400]),
    filled: false,
    focusColor: AppTheme.primaryColor,
    prefixIconColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.focused)
            ? Colors.white // Icon color for focused state in dark theme
            : Colors.black),
    border: OutlineInputBorder(
      borderSide: BorderSide(
          style: BorderStyle.solid, width: 1, color: AppTheme.grey[400]!),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          style: BorderStyle.solid, width: 1, color: AppTheme.grey[400]!),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppTheme.primaryColor,
      selectionHandleColor: AppTheme.primaryColor),
  canvasColor: AppTheme.bottomNavBlack,
);

ThemeData lightTheme = baseLight.copyWith(
  brightness: Brightness.light,
  primaryColor: AppTheme.primaryColor,
  textTheme: Get.textTheme
      .apply(displayColor: AppTheme.grey[700], bodyColor: AppTheme.grey[700]),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: AppTheme.textMdRegular.copyWith(color: AppTheme.grey[400]),
    filled: false,
    focusColor: AppTheme.primaryColor,
    prefixIconColor: WidgetStateColor.resolveWith((states) =>
        states.contains(WidgetState.focused) ? Colors.black : Colors.grey),
    border: OutlineInputBorder(
      borderSide: BorderSide(
          style: BorderStyle.solid, width: 1, color: AppTheme.grey[400]!),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          style: BorderStyle.solid, width: 1, color: AppTheme.grey[400]!),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppTheme.primaryColor,
      selectionHandleColor: AppTheme.primaryColor),
);

class ThemeController extends GetxController {
  var isDarkMode = true.obs;
  var themeMode = ThemeMode.system.obs;
  final storage = const FlutterSecureStorage();

  ThemeData get currentTheme => isDarkMode.value ? darkTheme : lightTheme;

  Future<void> saveThemeMode() async {
    try {
      await storage.write(
          key: 'isDarkMode', value: isDarkMode.value.toString());
    } catch (e) {
      // Handle storage write error
    }
  }

  Future<void> retrieveTheme() async {
    try {
      final savedIsDarkMode = await storage.read(key: 'isDarkMode');
      if (savedIsDarkMode != null) {
        isDarkMode.value = savedIsDarkMode == 'true';
        themeMode.value = isDarkMode.value ? ThemeMode.dark : ThemeMode.light;
      }
    } catch (e) {
      // Handle storage read error
    }
  }

  Future<void> initializeTheme() async {
    final isSystemDarkMode = Get.isDarkMode;
    isDarkMode.value = isSystemDarkMode;
    themeMode.value = isSystemDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;

    if (themeMode.value == ThemeMode.light) {
      themeMode.value = ThemeMode.dark;
    } else if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = Get.isDarkMode ? ThemeMode.light : ThemeMode.dark;
    }

    // Save the new theme mode
    saveThemeMode();
  }
}
