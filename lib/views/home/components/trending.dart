import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/provider/product_provider.dart';
import 'package:tezda_interview/utils/app_asset.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tezda_interview/views/home/components/product_card.dart';

class Trending extends StatelessWidget {
  final ProductProvider productProvider;
  const Trending({super.key, required this.productProvider});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<ProductController>();
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomNunitoText(
                text: "Trending",
                fontWeight: FontWeight.w600,
                textSize: 18,
                textColor: AppTheme.black,
              ),
              Row(
                children: [
                  const CustomNunitoText(
                    text: "View All",
                    fontWeight: FontWeight.w400,
                    textSize: 13,
                    textColor: AppTheme.black,
                  ),
                  const XMargin(5),
                  SvgPicture.asset(AppSvgAssets.forwardArrow),
                ],
              ),
            ],
          ),
          const YMargin(16),
          // controller.isLoading.value != true
          //     ?
          GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.65,
            ),
            itemCount: productProvider.products.products?.length ?? 0,
            itemBuilder: (context, index) {
              return ProductCard(
                  product: productProvider.products.products![index]);
            },
          )
          // : const ProductListShimmer(),
          // : const ShimmerTextParagraph(lines: 3),
        ],
      );
  }
}
