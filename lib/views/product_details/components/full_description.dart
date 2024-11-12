import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tezda_interview/provider/product_provider.dart';

class FullDescription extends StatelessWidget {
  const FullDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final productController =
        Provider.of<ProductProvider>(context, listen: true);
    String realDescription =
        productController.singleProduct.details?.longDesc ?? "";
    String specification =
        "SKU: AP044MPOWTGZHNAFAMZ\nProduct Line: Lamisol Gadgets\nModel: Iphone 13 Pro Max\nSize (L x W x H cm): 160.8 x 78.1 x 7.7 mm (6.33 x 3.07 x 0.30 in)\nWeight (kg): 0.24\nColor: Gold\nMain Material: Alloyed Material";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNunitoText(
            text: "Description",
            fontWeight: FontWeight.w600,
            textSize: 14,
            textColor: AppTheme.grey.shade300,
          ),
          CustomNunitoText(
            text: "Key Features",
            fontWeight: FontWeight.w600,
            textSize: 12,
            textColor: AppTheme.grey.shade300,
          ),
          CustomNunitoText(
            text: realDescription,
            fontWeight: FontWeight.w500,
            textSize: 12,
            textColor: AppTheme.grey.shade300,
          ),
          const YMargin(30),
          CustomNunitoText(
            text: "Specifications",
            fontWeight: FontWeight.w600,
            textSize: 12,
            textColor: AppTheme.grey.shade300,
          ),
          CustomNunitoText(
            text: specification,
            fontWeight: FontWeight.w500,
            textSize: 12,
            textColor: AppTheme.grey.shade300,
          ),
        ],
      ),
    );
  }
}
