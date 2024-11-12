import 'package:provider/provider.dart';
import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/provider/product_provider.dart';
import 'package:tezda_interview/utils/app_asset.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Reviews extends StatelessWidget {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductProvider>(context, listen: true);
    return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.reviews.data?.reviews?.length ?? 0,
          itemBuilder: (_, index) {
            final data = controller.reviews.data?.reviews![index];
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        initialRating: data!.rating!.toDouble(),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ignoreGestures: true,
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
                      const YMargin(10),
                      CustomNunitoText(
                        text: data.title,
                        fontWeight: FontWeight.w600,
                        textSize: 12,
                      ),
                      const YMargin(5),
                      CustomNunitoText(
                        text: data.comment,
                        fontWeight: FontWeight.w400,
                        textSize: 11,
                        textColor: AppTheme.grey.shade300,
                      ),
                      const YMargin(5),
                      Row(
                        children: [
                          if (data.user != null)
                            CustomNunitoText(
                              text:
                                  "Reviewed by ${data.user?.firstName ?? ""} ${data.user?.lastName ?? ""}",
                              fontWeight: FontWeight.w600,
                              textSize: 10,
                            ),
                          const XMargin(10),
                          SvgPicture.asset(
                            AppSvgAssets.success,
                            width: 18,
                            height: 18,
                          ),
                          const CustomNunitoText(
                            text: " Verified",
                            fontWeight: FontWeight.w600,
                            textSize: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const YMargin(10),
                const Divider(),
                const YMargin(10),
              ],
            );
          });
  }
}
