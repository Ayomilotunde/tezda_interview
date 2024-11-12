import 'package:provider/provider.dart';
import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/provider/product_provider.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRating extends StatelessWidget {
  const StarRating({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductProvider>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomNunitoText(
            text: "Reviews",
            fontWeight: FontWeight.w600,
            textSize: 14,
            textColor: AppTheme.black,
          ),
          const YMargin(7.5),
          const CustomNunitoText(
            text: "overRating",
            fontWeight: FontWeight.w300,
            textSize: 9.7,
            textColor: AppTheme.black,
          ),
          const YMargin(3),
          Row(
            children: [
              const CustomNunitoText(
                text: "5.0",
                fontWeight: FontWeight.w700,
                textSize: 14,
                textColor: AppTheme.black,
              ),
              const XMargin(6),
              RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 15,
                // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // setState(() {
                  // overallRate = rating;
                  // });
                },
              ),
              const XMargin(5),
              CustomNunitoText(
                text: "(${controller.reviews.data?.reviews?.length ?? 0})",
                fontWeight: FontWeight.w300,
                textSize: 12.69,
                textColor: AppTheme.black,
              ),
            ],
          ),
          const YMargin(7),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: controller.ratings.data?.the5?.toDouble() ?? 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // setState(() {
                      // overallRate = rating;
                      // });
                    },
                  ),
                  const XMargin(13),
                  const SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: AppTheme.amber,
                      minHeight: 5.29,
                      value: 1,
                    ),
                  ),
                  const XMargin(5),
                  const CustomNunitoText(
                    text: "(899)",
                    fontWeight: FontWeight.w300,
                    textSize: 12.69,
                    textColor: AppTheme.black,
                  ),
                ],
              ),
              const YMargin(10),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: controller.ratings.data?.the4?.toDouble() ?? 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // setState(() {
                      // overallRate = rating;
                      // });
                    },
                  ),
                  const XMargin(13),
                  const SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: AppTheme.amber,
                      minHeight: 5.29,
                      value: .8,
                    ),
                  ),
                  const XMargin(5),
                  const CustomNunitoText(
                    text: "(0)",
                    fontWeight: FontWeight.w300,
                    textSize: 12.69,
                    textColor: AppTheme.black,
                  ),
                ],
              ),
              const YMargin(10),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: controller.ratings.data?.the3?.toDouble() ?? 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // setState(() {
                      // overallRate = rating;
                      // });
                    },
                  ),
                  const XMargin(13),
                  const SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: AppTheme.amber,
                      minHeight: 5.29,
                      value: .6,
                    ),
                  ),
                  const XMargin(5),
                  const CustomNunitoText(
                    text: "(0)",
                    fontWeight: FontWeight.w300,
                    textSize: 12.69,
                    textColor: AppTheme.black,
                  ),
                ],
              ),
              const YMargin(10),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: controller.ratings.data?.the2?.toDouble() ?? 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // setState(() {
                      // overallRate = rating;
                      // });
                    },
                  ),
                  const XMargin(13),
                  const SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: AppTheme.amber,
                      minHeight: 5.29,
                      value: .4,
                    ),
                  ),
                  const XMargin(5),
                  const CustomNunitoText(
                    text: "(0)",
                    fontWeight: FontWeight.w300,
                    textSize: 12.69,
                    textColor: AppTheme.black,
                  ),
                ],
              ),
              const YMargin(10),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: controller.ratings.data?.the1?.toDouble() ?? 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 15,
                    // itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // setState(() {
                      // overallRate = rating;
                      // });
                    },
                  ),
                  const XMargin(13),
                  const SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      color: AppTheme.amber,
                      minHeight: 5.29,
                      value: .2,
                    ),
                  ),
                  const XMargin(5),
                  const CustomNunitoText(
                    text: "(0)",
                    fontWeight: FontWeight.w300,
                    textSize: 12.69,
                    textColor: AppTheme.black,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
