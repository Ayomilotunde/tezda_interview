import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tezda_interview/constants/palette.dart';
import 'package:tezda_interview/provider/auth_provider.dart';
import 'package:tezda_interview/provider/favourite_provider.dart';
import 'package:tezda_interview/provider/product_provider.dart';
import 'package:tezda_interview/provider/user_provider.dart';
import 'package:tezda_interview/services/navigation_service.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/views/splash/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppTheme.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => FavouriteProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(414.0, 896.0),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (child, _) => MaterialApp(
          title: 'Tezda',
          // builder: FToastBuilder(),
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Palette.kCustomColour,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: AppTheme.white,
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                fontSize: 14.0.sp,
              ),
            ),
          ),
          home: const SplashView(),
        ),
      ),
    );
  }
}

