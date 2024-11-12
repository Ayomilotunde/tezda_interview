import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_interview/services/navigation_service.dart';
import 'package:tezda_interview/utils/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_interview/utils/snackbar.dart';

import 'app_theme.dart';

double width(double width) {
  return ((width / 100.w) * 100).w;
}

double height(double height) {
  return ((height / 100.h) * 100).h;
}

class XMargin extends StatelessWidget {
  final double x;

  // ignore: use_key_in_widget_constructors
  const XMargin(this.x);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}

class YMargin extends StatelessWidget {
  final double y;

  // ignore: use_key_in_widget_constructors
  const YMargin(this.y);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}

// class CustomText extends StatelessWidget {
//   final String text;
//   final TextStyle style;
//   final TextAlign align;
//   // ignore: use_key_in_widget_constructors
//   const CustomText(
//       {required this.text, required this.style, this.align = TextAlign.center});
//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       textAlign: align,
//       text: TextSpan(
//         text: text,
//         style: style,
//       ),
//     );
//   }
// }
void setSnackBar(String title, String content,
        {Color? color, Color? textColor}) =>
openSnackBar(currentContext!, content, color ?? AppTheme.primaryColor);

    // Get.snackbar(title, content,
    //     colorText: textColor ?? AppTheme.black,
    //     backgroundColor: color ?? AppTheme.primaryColor);

// void setProgressDialog() => Get.dialog(const ProgressDialog(), barrierDismissible: false);
void setProgressDialog() => showDialog(
  context: currentContext!,
  barrierDismissible: false,
  builder: (BuildContext context) {
    return const Center(
      child: ProgressDialog()
    );
  },
);

// void getSnackBar(String status) => Get.showSnackbar(GetSnackBar(
//     messageText: CustomSnackBar(msg: status),
//     duration: 10.seconds,
//     backgroundColor: AppTheme.transparent));

Future<void> bottomSheet(BuildContext context, Widget child, {double? height}) {
  return showModalBottomSheet(
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(13), topRight: Radius.circular(13))),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => SizedBox(
          height: height ?? MediaQuery.of(context).size.height / 3,
          child: child));
}

String ordinal(int number) {
  if (!(number >= 1 && number <= 100)) {
    throw Exception('Invalid number');
  }

  if (number >= 11 && number <= 13) {
    return 'th';
  }

  switch (number % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
