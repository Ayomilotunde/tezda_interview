import 'package:provider/provider.dart';
import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/provider/auth_provider.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/button.dart';
import 'package:tezda_interview/utils/util_helpers.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  OtpFieldController otpController = OtpFieldController();
  String otp = '';
  late CountdownController countdownController;

  void setup(BuildContext context) async {
    countdownController = CountdownController(autoStart: true);
  }

  String intToTime(int value) {
    int h, m, s;
    h = value ~/ 3600;
    m = ((value - h * 3600)) ~/ 60;
    s = value - (h * 3600) - (m * 60);
    String hourLeft = h.toString().length < 2 ? "0$h" : h.toString();
    String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();
    String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();
    String result = "$hourLeft:$minuteLeft:$secondsLeft";
    return result;
  }

  @override
  void initState() {
    super.initState();

    setup(context);
    // productController.fetchAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, controller, child)=> Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const YMargin(100),
              const CustomNunitoText(
                text: 'Enter Verification Code',
                textSize: 26,
                fontWeight: FontWeight.w700,
                alignText: TextAlign.center,
              ),
              const YMargin(7),
              CustomNunitoText(
                text:
                    ' We have sent verification code to your email, kindly enter below.',
                textColor: AppTheme.grey.shade300,
                textSize: 14,
                fontWeight: FontWeight.w400,
                alignText: TextAlign.center,
              ),
              const YMargin(45),
              OTPTextField(
                controller: otpController,
                outlineBorderRadius: 5,
                length: 4,
                width: MediaQuery.of(context).size.width / 1.2,
                fieldWidth: 40,
                obscureText: true,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  otp = pin;
                },
                onChanged: (pin) {},
              ),
              const YMargin(45),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomNunitoText(
                    text: ' Code Expires in: ',
                    textColor: AppTheme.grey.shade300,
                    textSize: 14,
                    fontWeight: FontWeight.w400,
                    alignText: TextAlign.center,
                  ),
                  const XMargin(5),
                  Countdown(
                    seconds: 1800,
                    build: (BuildContext context, double time) =>
                        CustomNunitoText(
                      text: "${intToTime(time.toInt())}s",
                      textSize: 14,
                      textColor: AppTheme.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    interval: const Duration(seconds: 1),
                    controller: countdownController,
                    onFinished: () {
                      //
                    },
                  ),
                ],
              ),
              const YMargin(0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomNunitoText(
                    text: " Didn't receive any code?",
                    textColor: AppTheme.grey.shade300,
                    textSize: 14,
                    fontWeight: FontWeight.w400,
                    alignText: TextAlign.center,
                  ),
                  const XMargin(5),
                  GestureDetector(
                    onTap: (){},
                    child: const CustomNunitoText(
                      text: ' Resend Code',
                      textColor: AppTheme.primaryColor,
                      textSize: 14,
                      fontWeight: FontWeight.w500,
                      alignText: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const YMargin(60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Button(
                  onPressed: () async {
                    // if(pin == ''){
                    //   openSnackBar(context, "Please input your verification code.", AppTheme.primaryColor);
                    //   // getSnackBar("Please select user type.");
                    // } else {
                    await controller.verifyUser(context, otp);

                    // }
                  },
                  text: "Continue",
                  color: AppTheme.primaryColor,
                  textColor: AppTheme.white,
                  block: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
