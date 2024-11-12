import 'package:provider/provider.dart';
import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/provider/favourite_provider.dart';
import 'package:tezda_interview/provider/product_provider.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:tezda_interview/views/favourite/components/empty_favourite.dart';
import 'package:tezda_interview/views/favourite/components/favourite_items.dart';
import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key, });

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, provider, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const CustomNunitoText(
              text: "Favourite",
              fontWeight: FontWeight.w600,
              textColor: AppTheme.black,
              textSize: 22,
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              setProgressDialog();
              await provider.fetchFavourite();
              Navigator.pop(context);
            },
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              padding: const EdgeInsets.all(10),
              children: [
                provider.favourite.favorites != null &&
                    provider.favourite.favorites!.isNotEmpty
                    ? FavouriteItems(productProvider: provider,)
                    : const EmptyFavourite(),
              ],
            ),
          ),
        ),
    )
    ;
  }
}
