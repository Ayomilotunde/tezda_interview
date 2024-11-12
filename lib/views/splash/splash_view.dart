import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/utils/next_screen.dart';
import 'package:tezda_interview/views/auth/login_view.dart';
import 'package:tezda_interview/views/home/home_base_view.dart';

import '../../services/secure_storage/secure_storage.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool? _loggedIn;
  String? uType;

  @override
  void initState() {
    super.initState();

    _checkForAlreadyLoggedInUser();
  }

  Future<void> init() async {
    Timer(
      const Duration(seconds: 4),
      () => nextScreenReplace(context, _loggedIn == true ? const HomeBaseView() : const LoginView()),
    );

    setState(() {});
  }

  @override
  void didChangeDependencies() {
    init();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<String?> getDeviceId() async {
    String? deviceId = '';
    // await PlatformDeviceId.getDeviceId;
    return deviceId;
  }

  void _checkForAlreadyLoggedInUser() async {
    final login = await SecureStorage().retrieveLoggedIn();
    setState(() {
      _loggedIn = login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CustomNunitoText(text: "Tezda"),
      ),
    );
  }
}
