import 'package:provider/provider.dart';
import 'package:tezda_interview/provider/product_provider.dart';
import 'package:tezda_interview/utils/app_asset.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/button.dart';
import 'package:tezda_interview/utils/loading_overlay.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:tezda_interview/views/product_details/components/buy_now_view.dart';
import 'package:tezda_interview/views/product_details/components/delivery_section.dart';
import 'package:tezda_interview/views/product_details/components/feature_images.dart';
import 'package:tezda_interview/views/product_details/components/full_description.dart';
import 'package:tezda_interview/views/product_details/components/main_image.dart';
import 'package:tezda_interview/views/product_details/components/product_details.dart';
import 'package:tezda_interview/views/product_details/components/reviews.dart';
import 'package:tezda_interview/views/product_details/components/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsView();
}

class _ProductDetailsView extends State<ProductDetailsView> {
  // final cartController =Provider.of<ProductProvider>(context, listen: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductProvider>(context, listen: true);
    return NewLoadingOverlay(
      // isLoading: controller.isLoading.value,
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MainImage(),
              const YMargin(10),
              const FeatureImages(),
              const YMargin(20),
              const ProductDetails(),
              const YMargin(10),
              const Divider(),
              const YMargin(10),
              FullDescription(),
              const YMargin(10),
              const Divider(),
              const YMargin(10),
              const StarRating(),
              const YMargin(10),
              const Divider(),
              const YMargin(10),
              const Reviews(),
              const YMargin(10),
              const DeliverySection(),
              const YMargin(10),
              const YMargin(40),
            ],
          ),
        ),
        bottomNavigationBar: controller.singleProduct.details!.quantity != 0
            ? Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 15, bottom: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // nextScreen(context, const CartView());
                      },
                      child: SvgPicture.asset(
                        AppSvgAssets.cart,
                        width: 28,
                        height: 28,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    const XMargin(15),
                    Expanded(
                      child: SizedBox(
                        height: 37,
                        child: Button(
                          onPressed: () async {},
                          text: 'Add to Cart',
                          color: AppTheme.white,
                          borderColor: AppTheme.primaryColor,
                          block: true,
                          textColor: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                    const XMargin(8),
                    Expanded(
                      child: SizedBox(
                        height: 37,
                        child: Button(
                          onPressed: (){},
                          text: 'Buy Now',
                          color: AppTheme.primaryColor,
                          borderColor: AppTheme.primaryColor,
                          block: true,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
