import 'package:provider/provider.dart';
import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/model/product_response.dart';
import 'package:tezda_interview/provider/favourite_provider.dart';
import 'package:tezda_interview/provider/product_provider.dart';
import 'package:tezda_interview/utils/app_asset.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/button.dart';
import 'package:tezda_interview/utils/dialog.dart';
import 'package:tezda_interview/utils/next_screen.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_interview/views/product_details/product_details_view.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context, listen: true);
    final productProvider =   Provider.of<ProductProvider>(context, listen: true);
    return GestureDetector(
      onTap: () async {
        setProgressDialog();
        productProvider.productID = widget.product.id ?? '';
        await productProvider.fetchAProducts();
        Navigator.pop(context);
        nextScreen(context, const ProductDetailsView());
        // Get.to(() => const ProductDetailsView());
      },
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppTheme.grey.shade100.withOpacity(.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          widget.product.images != null &&
                                  widget.product.images!.isNotEmpty
                              ? Image.network(
                                  widget.product.images!.first,
                                  fit: BoxFit.contain,
                                  width: 145.13,
                                  height: 132,
                                )
                              : Image.asset(
                                  AppImgAssets.logoWhite,
                                  fit: BoxFit.contain,
                                  color: AppTheme.primaryColor,
                                  width: 145.13,
                                  height: 132,
                                ),
                        ],
                      ),
                    ),
                  ),
                  const YMargin(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomNunitoText(
                              text: widget.product.name,
                              fontWeight: FontWeight.w600,
                              maxline: 1,
                              overflow: TextOverflow.ellipsis,
                              textSize: 11.0,
                            ),
                            CustomNunitoText(
                              text: widget.product.description,
                              fontWeight: FontWeight.w400,
                              maxline: 2,
                              overflow: TextOverflow.ellipsis,
                              textSize: 10.0,
                              textColor: AppTheme.grey,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 30,
                      )
                    ],
                  ),
                  const YMargin(5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const YMargin(5),
                      CustomNunitoText(
                        text: widget.product.price.toString(),
                        fontWeight: FontWeight.w600,
                        textSize: 11.0,
                        isMoney: true,
                        textColor: AppTheme.grey[600],
                      ),
                      if (widget.product.vendorPriceRanges != null &&
                          widget.product.vendorPriceRanges!.isNotEmpty)
                        CustomNunitoText(
                          text:
                              "Min. Order: ${widget.product.vendorPriceRanges?.first.minQuantity ?? 1} pieces",
                          fontWeight: FontWeight.w400,
                          textSize: 10.0,
                          // isMoney: true,
                          textColor: AppTheme.grey[500],
                        )
                      else
                        CustomNunitoText(
                          text: "Min. Order: 1 pieces",
                          fontWeight: FontWeight.w400,
                          textSize: 10.0,
                          // isMoney: true,
                          textColor: AppTheme.grey[500],
                        ),
                    ],
                  ),
                  const YMargin(15),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 25,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Button(
                            onPressed: () {},
                            text: 'Add to Cart',
                            color: AppTheme.deeperGreen,
                            borderColor: AppTheme.deeperGreen,
                            block: true,
                            textColor: Colors.white,
                            textSize: 8.5.sp,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          favouriteProvider.productID = widget.product.id!;

                          widget.product.favorited = !widget.product.favorited!;
                          setState(() {});
                          if (widget.product.favorited == true) {
                            setSnackBar("Success", "Item Added Successfully",
                                color: AppTheme.deeperGreen,
                                textColor: AppTheme.white);
                            await favouriteProvider
                                .addToFavourite()
                                .then((isSuccess) {
                              if (isSuccess) {
                                productProvider.fetchAllProducts();
                              } else {
                                widget.product.favorited =
                                    !widget.product.favorited!;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CustomAlertDialog(
                                      title: "Error",
                                      content: favouriteProvider.errorMessage,
                                    );
                                  },
                                );
                              }
                            });
                          } else {
                            setSnackBar("Success", "Item Removed Successfully",
                                color: AppTheme.deeperGreen,
                                textColor: AppTheme.white);
                            await favouriteProvider
                                .removeFromFavourite()
                                .then((isSuccess) {
                              if (isSuccess) {
                              } else {
                                widget.product.favorited =
                                    !widget.product.favorited!;
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CustomAlertDialog(
                                      title: "Error",
                                      content: favouriteProvider.errorMessage,
                                    );
                                  },
                                );
                              }
                            });
                          }
                        },
                        child: widget.product.favorited != null &&
                                widget.product.favorited!
                            ? const Icon(
                                Icons.favorite,
                                color: AppTheme.deeperGreen,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: AppTheme.deeperGreen,
                              ),
                      )
                    ],
                  ),
                  const YMargin(10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
