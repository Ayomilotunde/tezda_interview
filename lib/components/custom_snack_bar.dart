import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_theme.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({super.key, required this.msg});

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.13.w, vertical: 1.5.h),
      padding: EdgeInsets.symmetric(horizontal: 4.27.w, vertical: 1.35.h),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.2),
            blurRadius: 12.0,
            spreadRadius: 0.5,
            offset: const Offset(
              5,
              5,
            ),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.info,
            color: AppTheme.white,
          ),
          SizedBox(width: 3.73.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: msg,
                style: AppTheme.textSmRegular.copyWith(color: AppTheme.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
