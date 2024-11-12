import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tezda_interview/provider/product_provider.dart';

class FeatureImages extends StatelessWidget {
  const FeatureImages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ProductProvider>(context, listen: true);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: controller.singleProduct.details!.images!
            .map((image) => Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover)),
                ))
            .toList(),
      ),
    );
    // : Container(
    //   margin: const EdgeInsets.symmetric(horizontal: 22),
    //   child: Row(
    //     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: controller.product.images!
    //         .map((image) => Container(
    //               height: 72,
    //               width: 72,
    //               decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(8),
    //                   image: DecorationImage(
    //                       image: NetworkImage(image), fit: BoxFit.cover)),
    //             ))
    //         .toList(),
    //   ),
    // );
  }
}
