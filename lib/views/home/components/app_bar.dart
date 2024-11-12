import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/utils/app_asset.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget {
  final String name;
  final String? userImage;

  const DashboardAppBar(
      {super.key, required this.name, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              userImage != null && userImage != ""
                  ? Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: NetworkImage(userImage!),
                              fit: BoxFit.cover),
                          color: AppTheme.primaryColor),
                    )
                  : Container(
                      width: 32,
                      height: 32,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: .1),
                          image: const DecorationImage(
                              image: AssetImage(AppImgAssets.logoWhite),
                              fit: BoxFit.contain),
                          color: AppTheme.white),
                    ),
              const XMargin(8),
              CustomNunitoText(
                text: "Welcome $name",
                textSize: 18,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 34,
            height: 34,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: AppTheme.grey.shade100.withOpacity(.4),
                shape: BoxShape.circle),
            child: const Icon(Icons.notifications_none),
          ),
        )
      ],
    );
  }
}
