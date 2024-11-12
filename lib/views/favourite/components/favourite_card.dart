import 'package:flutter/material.dart';
import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/model/favourite/favourite.dart';
import 'package:tezda_interview/provider/favourite_provider.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/button.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:tezda_interview/views/favourite/components/remove_product.dart';

class FavouriteCard extends StatefulWidget {
  final Favorite product;
  final FavouriteProvider productProvider;
  const FavouriteCard(
      {super.key, required this.product, required this.productProvider});

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // setProgressDialog();
        // widget.productProvider.product = Product();
        // widget.productProvider.productID = widget.product.id ?? '';
        // await widget.productProvider.fetchAProducts();
        // Navigator.pop(currentContext!);
        // nextScreen(context, ProductDetailsView());
      },
      child: Card(
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
                      Image.network(
                        widget.product.images!.first,
                        fit: BoxFit.contain,
                        width: 145.13,
                        height: 142,
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
                          text: widget.product.name ?? "",
                          fontWeight: FontWeight.w600,
                          maxline: 1,
                          overflow: TextOverflow.ellipsis,
                          textSize: 11.0,
                        ),
                        CustomNunitoText(
                          text: widget.product.slug ?? "",
                          fontWeight: FontWeight.w400,
                          textSize: 10.0,
                          textColor: AppTheme.grey[400],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 30,
                  )
                  // Container(
                  //   padding: const EdgeInsets.all(3),
                  //   decoration: BoxDecoration(
                  //       color: AppTheme.grey.shade100.withOpacity(.5),
                  //       borderRadius: BorderRadius.circular(10)),
                  //   child: Row(
                  //     children: [
                  //       const Icon(
                  //         Icons.star,
                  //         color: Colors.amber,
                  //         size: 16.0,
                  //       ),
                  //       CustomNunitoText(
                  //         text: product.id!.length.toString(),
                  //         fontWeight: FontWeight.w400,
                  //         textSize: 10.0,
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                  CustomNunitoText(
                    text: "Min. Order: 10 pieces",
                    fontWeight: FontWeight.w400,
                    textSize: 10.0,
                    // isMoney: true,
                    textColor: AppTheme.grey[400],
                  ),
                ],
              ),
              const YMargin(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Button(
                        onPressed: () async {
                          // cartController.addItem(widget.product.id!);
                          // await cartController.addToCart().then((isSuccess) {
                          //   if (isSuccess) {
                          //     setSnackBar(
                          //         "Success", cartController.successMessage);
                          //   } else {
                          //     showDialog(
                          //       context: context,
                          //       builder: (context) {
                          //         return CustomAlertDialog(
                          //           title: "Error",
                          //           content: cartController.errorMessage,
                          //         );
                          //       },
                          //     );
                          //   }
                          // });
                        },
                        text: 'Add to Cart',
                        color: AppTheme.primaryColor,
                        borderColor: AppTheme.primaryColor,
                        block: true,
                        textSize: 10,
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        widget.productProvider.productID = widget.product.id!;
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(5.0)),
                          ),
                          isScrollControlled: true,
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * .65),
                          builder: (context) => const RemoveProduct(),
                        );
                      },
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppTheme.primaryColor),
                            borderRadius: BorderRadius.circular(999)),
                        child: const Icon(
                          Icons.delete_outline,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const YMargin(10)
            ],
          ),
        ),
      ),
    );
  }
}
