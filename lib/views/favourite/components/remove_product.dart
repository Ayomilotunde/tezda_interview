import 'package:provider/provider.dart';
import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/provider/favourite_provider.dart';
import 'package:tezda_interview/provider/product_provider.dart';
import 'package:tezda_interview/services/navigation_service.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/button.dart';
import 'package:tezda_interview/utils/dialog.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RemoveProduct extends StatelessWidget {
  const RemoveProduct({super.key, });

  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteProvider>(
      builder: (context, provider, child) => Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 29),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                ),
                const CustomNunitoText(
                  text: "Delete",
                  fontWeight: FontWeight.w600,
                  textSize: 15,
                  alignText: TextAlign.center,
                  textColor: AppTheme.grey,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const Divider(),
            const YMargin(17),
            CustomNunitoText(
              text: "Confirm to delete this product?",
              fontWeight: FontWeight.w400,
              textSize: 15,
              alignText: TextAlign.center,
              textColor: AppTheme.grey.shade300,
            ),
            const YMargin(40),
            Button(
              onPressed: () async {
                Navigator.pop(context);
                await provider.removeFromFavourite().then((isSuccess) {
                  if (isSuccess) {
                    setSnackBar("Success", provider.successMessage);
                  } else {
                    showDialog(
                      context: currentContext!,
                      builder: (context) {
                        return CustomAlertDialog(
                          title: "Error",
                          content: provider.errorMessage,
                        );
                      },
                    );
                  }
                });
              },
              text: 'Confirm',
              color: AppTheme.white,
              borderColor: AppTheme.primaryColor,
              block: true,
              textSize: 20,
              textColor: AppTheme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
