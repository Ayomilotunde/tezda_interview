// import 'package:tezda_interview/components/custom_text.dart';
// import 'package:tezda_interview/utils/app_asset.dart';
// import 'package:tezda_interview/utils/app_theme.dart';
// import 'package:tezda_interview/utils/util_helpers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class Categories extends StatelessWidget {
//   Categories({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const CustomNunitoText(
//                 text: "Categories",
//                 fontWeight: FontWeight.w600,
//                 textSize: 18,
//                 textColor: AppTheme.black,
//               ),
//               GestureDetector(
//                 onTap: () async {
//                 },
//                 child: Row(
//                   children: [
//                     const CustomNunitoText(
//                       text: "View All",
//                       fontWeight: FontWeight.w400,
//                       textSize: 13,
//                       textColor: AppTheme.black,
//                     ),
//                     const XMargin(5),
//                     SvgPicture.asset(AppSvgAssets.forwardArrow),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           const YMargin(16),
//           // if (categoriesController.categories.value.categories != null)
//             SizedBox(
//               height: 110.h,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   // itemCount: categoriesController.categories.value.categories!.length >= 4
//                   //     ? categoriesController.categories.value.categories?.length
//                   //     : categoriesController.categories.value.categories?.length ?? 0,
//                   itemCount: 0,
//                   itemBuilder: (_, index) {
//                     // final data = categoriesController.categories.value.categories![index];
//                     final data = [index];
//                     return GestureDetector(
//                       onTap: () {
//                         // productController.searchText?.value = data.name!;
//                         // productController.categoryID.value = data.id!;
//                         // productController.goToSelectedCategoryProduct(context);
//                       },
//                       child: Column(
//                         children: [
//                           Container(
//                             width: 64,
//                             height: 64,
//                             padding: const EdgeInsets.all(16),
//                             margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                             decoration: BoxDecoration(
//                               color: index == 0
//                                   ? AppTheme.laptopBackground.withOpacity(.15)
//                                   : index == 1
//                                       ? AppTheme.phoneBackground.withOpacity(.15)
//                                       : index == 2
//                                           ? AppTheme.watchBackground.withOpacity(.15)
//                                           : index == 3
//                                               ? AppTheme.chargerBackground.withOpacity(.15)
//                                               : AppTheme.chargerBackground.withOpacity(.15),
//                               shape: BoxShape.circle,
//                             ),
//                             child: data.img != null
//                                 ? Image(image: NetworkImage(data.img!))
//                                 : data.name! == "Laptop"
//                                     ? SvgPicture.asset(AppSvgAssets.laptop)
//                                     : data.name! == "Laptop"
//                                         ? SvgPicture.asset(AppSvgAssets.watch)
//                                         : SvgPicture.asset(AppSvgAssets.charger),
//                           ),
//                           const YMargin(4),
//                           CustomNunitoText(
//                             text: data.name,
//                             fontWeight: FontWeight.w500,
//                             textSize: 13,
//                             textColor: AppTheme.black,
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//         ],
//       );
//   }
// }
