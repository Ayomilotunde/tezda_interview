import 'package:provider/provider.dart';
import 'package:tezda_interview/provider/product_provider.dart';
import 'package:tezda_interview/utils/app_asset.dart';
import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  const MainImage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductProvider>(context, listen: true);
    return Container(
        // width: 390,
        height: 360,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: controller.singleProduct.details!.images != null &&
                        controller
                            .singleProduct.details!.images!.isNotEmpty
                    ? NetworkImage(
                        controller.singleProduct.details!.images!.first)
                    : const AssetImage(AppImgAssets.logoWhite),
                fit: BoxFit.cover)),
      );
    // : Container(
    //   // width: 390,
    //   height: 360,
    //   decoration: BoxDecoration(
    //       image: DecorationImage(
    //           image: NetworkImage(controller.product.images!.first),
    //           fit: BoxFit.cover)),
    // );
  }
}
