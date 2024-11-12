import 'package:tezda_interview/provider/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:tezda_interview/views/favourite/components/favourite_card.dart';

class FavouriteItems extends StatelessWidget {
  final FavouriteProvider productProvider;
  const FavouriteItems({super.key, required this.productProvider});

  // final favController = Get.find<FavouriteController>();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.65,
      ),
      itemCount: productProvider.favourite.favorites?.length ?? 0,
      itemBuilder: (context, index) {
        return FavouriteCard(
          product: productProvider.favourite.favorites![index],
          productProvider: productProvider,
        );
      },
    );
  }
}
