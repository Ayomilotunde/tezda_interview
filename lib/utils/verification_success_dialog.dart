import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/button.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showVerificationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const YMargin(51),
              SvgPicture.asset("assets/svgs/success_icon.svg"),
              const YMargin(18),
              const Text(
                'Verification Successful',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                'Click the button below to proceed',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              const YMargin(59),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Button(
                  onPressed: () {
                    // Get.to(() => const LoginPage());
                  },
                  text: "Continue",
                  color: AppTheme.primaryColor,
                  textColor: AppTheme.white,
                  block: true,
                ),
              ),
              const YMargin(35),
            ],
          ),
        ),
      );
    },
  );
}
