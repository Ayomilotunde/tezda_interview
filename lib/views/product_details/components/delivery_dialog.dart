import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:flutter/material.dart';

class DeliveryDetailsDialog extends StatelessWidget {
  final String details;
  final String amount;
  const DeliveryDetailsDialog(
      {super.key, required this.details, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 22.0, right: 14, top: 30, bottom: 23),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: CustomNunitoText(
                    text: 'Delivery Details',
                    textSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const YMargin(8.5),
            CustomNunitoText(
              text: 'Pickup Station',
              textSize: 10,
              fontWeight: FontWeight.w500,
              textColor: AppTheme.grey.shade300,
            ),
            const YMargin(4),
            CustomNunitoText(
              text: details,
              textSize: 12,
              fontWeight: FontWeight.w400,
              textColor: AppTheme.grey.shade300,
            ),
            const YMargin(4),
            CustomNunitoText(
              text: 'Delivery Fee Details',
              textSize: 10,
              fontWeight: FontWeight.w500,
              textColor: AppTheme.grey.shade300,
            ),
            const YMargin(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomNunitoText(
                  text: 'Total Delivery Amount',
                  textSize: 10,
                  fontWeight: FontWeight.w500,
                  textColor: AppTheme.black,
                ),
                CustomNunitoText(
                  text: amount,
                  textSize: 12,
                  fontWeight: FontWeight.w600,
                  textColor: AppTheme.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
