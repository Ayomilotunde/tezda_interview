import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/utils/app_asset.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/button.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:flutter/material.dart';

class CancelOrderDialog extends StatelessWidget {
  final String details;

  const CancelOrderDialog({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 22.0, right: 14, top: 30, bottom: 23),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: CustomNunitoText(
                    text: 'Cancel Item',
                    textSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const YMargin(8.5),
            CustomNunitoText(
              text: details,
              textSize: 13,
              fontWeight: FontWeight.w500,
              textColor: AppTheme.greyTextColor,
            ),
            const YMargin(4),
          ],
        ),
      ),
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  final String? title;
  final String content;

  const CustomAlertDialog({super.key, this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              // Color(0xFFAA00FF), // Start color
              // Color(0xFFFF00FF), // End color
              AppTheme.alertError,
              AppTheme.secondaryColor
            ],
          ),
        ),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 13),
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red.shade100,
                child: Image.asset(
                  AppImgAssets.error,
                  height: 107,
                  width: 107,
                ),
              ),
              const SizedBox(height: 22),
              Text(
                title ?? '',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.w400),
              ),
              const YMargin(44),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomEmptyDialog extends StatelessWidget {
  final String? title;
  final String content;
  final Function()? onPressed;

  const CustomEmptyDialog({super.key, this.title, required this.content, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [
              // Color(0xFFAA00FF), // Start color
              // Color(0xFFFF00FF), // End color
              AppTheme.alertError,
              AppTheme.secondaryColor
            ],
          ),
        ),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.0, top: 13),
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red.shade100,
                child: Image.asset(
                  AppImgAssets.error,
                  height: 107,
                  width: 107,
                ),
              ),
              const SizedBox(height: 22),
              Text(
                title ?? '',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.w400),
              ),
              const YMargin(44),
              SizedBox(
                  height: 45,
                  child: Button(
                    onPressed: onPressed,
                    text: "Add Address",
                    color: AppTheme.deeperGreen,
                    block: true,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
