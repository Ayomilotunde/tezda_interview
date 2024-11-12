import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/utils/app_asset.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/button.dart';
import 'package:tezda_interview/utils/next_screen.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tezda_interview/views/home/home_base_view.dart';

class EmptyFavourite extends StatelessWidget {
  const EmptyFavourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.3,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppSvgAssets.emptyBox),
          const CustomNunitoText(
              text: "No data available",
              textSize: 15.93,
              fontWeight: FontWeight.w400,
              textColor: AppTheme.black,
              alignText: TextAlign.center,
              softwrap: true,
              maxline: 2,
              overflow: TextOverflow.ellipsis),
          const YMargin(23),
          Container(
            height: 37,
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Button(
              onPressed: () {
                // Get.back();
                // Get.to(() => const FavouriteItems());
                nextScreenReplace(context, const HomeBaseView());
              },
              text: 'Go Shopping',
              color: AppTheme.primaryColor,
              borderColor: AppTheme.primaryColor,
              block: true,
              textColor: Colors.white,
            ),
          ),
          const YMargin(78),
        ],
      ),
    );
  }
}
