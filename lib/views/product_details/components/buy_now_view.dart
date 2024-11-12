// import 'package:aino_retailer/components/custom_label_text_form_field.dart';
// import 'package:aino_retailer/components/custom_text.dart';
// import 'package:aino_retailer/constants/constants.dart';
// import 'package:aino_retailer/controller/cart_controller.dart';
// import 'package:aino_retailer/controller/product_controller.dart';
// import 'package:aino_retailer/services/navigation_service.dart';
// import 'package:aino_retailer/utils/app_theme.dart';
// import 'package:aino_retailer/utils/button.dart';
// import 'package:aino_retailer/utils/dialog.dart';
// import 'package:aino_retailer/utils/util_helpers.dart';
// import 'package:aino_retailer/views/checkout/checkout_view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class BuyProductDialog extends StatefulWidget {
//   const BuyProductDialog({super.key});
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _BuyProductDialogState createState() => _BuyProductDialogState();
// }
//
// class _BuyProductDialogState extends State<BuyProductDialog> {
//   final productController = Get.find<ProductController>();
//   final cartController = Get.find<CartController>();
//   final quantityController = TextEditingController();
//
//   int _quantity = 1;
//   int? _amount;
//
//   void _incrementQuantity() {
//     setState(() {
//       _quantity++;
//     });
//     _amount = _quantity * productController.singleProduct.value.details!.price!;
//     quantityController.text = _quantity.toString();
//   }
//
//   void _decrementQuantity() {
//     if (_quantity > 1) {
//       setState(() {
//         _quantity--;
//       });
//     }
//     _amount = _quantity * productController.singleProduct.value.details!.price!;
//     quantityController.text = _quantity.toString();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _amount = productController.singleProduct.value.details?.price;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => SingleChildScrollView(
//         // color: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 29),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: () => Navigator.of(context).pop(),
//                 ),
//               ],
//             ),
//             const Divider(),
//             const YMargin(17),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 125,
//                   height: 125,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       image: NetworkImage(productController.singleProduct.value.details?.images?.first ??
//                           "https://ainotechglobal.com/images/66e1fad15b73d-tv.jpeg"),
//                       // Replace with your image asset
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Align(
//                     alignment: Alignment.topRight,
//                     child: Container(
//                       padding: const EdgeInsets.all(4.0),
//                       margin: const EdgeInsets.all(7.0),
//                       decoration: const BoxDecoration(color: AppTheme.white, shape: BoxShape.circle),
//                       child: const Icon(
//                         Icons.open_in_full,
//                         size: 16,
//                         color: Colors.black54,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomNunitoText(
//                         text: productController.singleProduct.value.details?.name ?? '',
//                         fontWeight: FontWeight.w600,
//                         textSize: 17.53,
//                       ),
//                       CustomNunitoText(
//                         text: productController.singleProduct.value.details?.description ?? '',
//                         fontWeight: FontWeight.w400,
//                         textSize: 15.93,
//                         maxline: 4,
//                         overflow: TextOverflow.ellipsis,
//                         textColor: AppTheme.grey,
//                       ),
//                       const YMargin(26),
//                       CustomNunitoText(
//                         text: "${productController.singleProduct.value.details?.price ?? '0'}",
//                         decoration: TextDecoration.lineThrough,
//                         fontWeight: FontWeight.w600,
//                         textSize: 17.53,
//                         isMoney: true,
//                         textColor: AppTheme.grey,
//                       ),
//                       CustomNunitoText(
//                         text:
//                             // "N2,250,000",
//                             "${_amount ?? 0}".replaceAllMapped(reg, mathFunc),
//                         // "${productController.singleProduct.details?.price ?? ''}",
//                         fontWeight: FontWeight.w600,
//                         textSize: 22.31,
//                         isMoney: true,
//                         textColor: AppTheme.green,
//                       ),
//                       const YMargin(13),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const YMargin(37),
//             Row(
//               children: [
//                 const CustomNunitoText(
//                   text: "Quantity",
//                   fontWeight: FontWeight.w400,
//                   textSize: 18,
//                 ),
//                 const XMargin(10),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2.07),
//                   decoration: BoxDecoration(
//                       color: AppTheme.grey.shade100.withOpacity(.3), borderRadius: BorderRadius.circular(3)),
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: _decrementQuantity,
//                         child: const Icon(
//                           Icons.remove,
//                           size: 24,
//                         ),
//                       ),
//                       const XMargin(37),
//                       CustomNunitoText(
//                         text: '$_quantity',
//                         fontWeight: FontWeight.w600,
//                         textSize: 18,
//                       ),
//                       const XMargin(37),
//                       GestureDetector(
//                         onTap: _incrementQuantity,
//                         child: const Icon(
//                           Icons.add,
//                           size: 24,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const YMargin(10),
//             CustomLabelInputText(
//               controller: quantityController,
//               label: "",
//               placeholder: "Quantity (1)",
//               keyboardType: TextInputType.number,
//               inputAction: TextInputAction.done,
//             ),
//             const YMargin(49),
//             Button(
//               onPressed: () async {
//                 Get.back();
//                 await cartController.clearCartItems();
//                 cartController.addItem(productController.singleProduct.value.details!.id!, quantity: _quantity);
//                 await cartController.addToCart().then((isSuccess) async {
//                   if (isSuccess) {
//                     // setSnackBar("Success", cartController.successMessage);
//                     await cartController.estimatedPrice();
//                     Get.to(() => const CheckoutView());
//                   } else {
//                     showDialog(
//                       context: currentContext!,
//                       builder: (context) {
//                         return CustomAlertDialog(
//                           title: "Error",
//                           content: cartController.errorMessage,
//                         );
//                       },
//                     );
//                   }
//                 });
//               },
//               text: 'Confirm',
//               color: AppTheme.primaryColor,
//               borderColor: AppTheme.primaryColor,
//               block: true,
//               textSize: 12,
//               textColor: Colors.white,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
