import 'package:provider/provider.dart';
import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/provider/product_provider.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductProvider>(context, listen: true);
    double overallRate = 5;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNunitoText(
            text: controller.singleProduct.details?.name ?? "",
            fontWeight: FontWeight.w600,
            textSize: 17.53,
          ),
          const YMargin(4),
          CustomNunitoText(
            text: controller.singleProduct.details?.description ?? "",
            fontWeight: FontWeight.w400,
            textSize: 13.93,
            textColor: AppTheme.grey,
          ),
          const YMargin(26),
          // CustomNunitoText(
          //   text: "${controller.singleProduct.details?.price ?? 0}",
          //   decoration: TextDecoration.lineThrough,
          //   fontWeight: FontWeight.w600,
          //   textSize: 17.53,
          //   isMoney: true,
          //   textColor: AppTheme.grey,
          // ),
          // CustomNunitoText(
          //   text: "${controller.singleProduct.details?.price ?? 0}",
          //   fontWeight: FontWeight.w600,
          //   textSize: 22.31,
          //   isMoney: true,
          //   textColor: AppTheme.green,
          // ),
          const YMargin(13),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomNunitoText(
                    text: "${controller.singleProduct.details?.price ?? 0}",
                    fontWeight: FontWeight.w600,
                    textSize: 18.sp,
                    isMoney: true,
                    textColor: AppTheme.grey[600],
                  ),
                  const YMargin(3),
                  CustomNunitoText(
                    text: "Min. Order: ${controller.singleProduct.details?.minOrderQty ?? 0}",
                    fontWeight: FontWeight.w400,
                    textSize: 13.sp,
                    textColor: AppTheme.grey[400],
                  ),
                ],
              ),
              if (controller.singleProduct.details != null &&
                  controller.singleProduct.details!.priceRanges != null)
                Container(
                  color: AppTheme.primaryColor.withOpacity(.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: controller.singleProduct.details!.priceRanges!
                        .map(
                          (prices) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CustomNunitoText(
                                  text: "${prices.price ?? 0}",
                                  fontWeight: FontWeight.w600,
                                  textSize: 14.sp,
                                  isMoney: true,
                                  textColor: AppTheme.grey[600],
                                ),
                                const YMargin(3),
                                CustomNunitoText(
                                  text: "${prices.maxQuantity} pieces",
                                  fontWeight: FontWeight.w400,
                                  textSize: 10.sp,
                                  textColor: AppTheme.grey[400],
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                )
            ],
          ),
          const YMargin(13),
          Row(
            children: [
              RatingBar.builder(
                initialRating: overallRate,
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
                  overallRate = rating;
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
        ],
      ),
    );
  }
}
