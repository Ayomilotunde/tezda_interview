import 'package:tezda_interview/components/custom_text.dart';
import 'package:tezda_interview/utils/app_asset.dart';
import 'package:tezda_interview/utils/app_theme.dart';
import 'package:tezda_interview/utils/util_helpers.dart';
import 'package:tezda_interview/views/product_details/components/delivery_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

class DeliverySection extends StatefulWidget {
  const DeliverySection({super.key});

  @override
  State<DeliverySection> createState() => _DeliverySection();
}

class _DeliverySection extends State<DeliverySection> {
  String? _selectedState;
  String stateValue = NigerianStatesAndLGA.allStates[0];
  String lgaValue = 'Select Location';
  String selectedLGAFromAllLGAs = NigerianStatesAndLGA.getAllNigerianLGAs()[0];
  List<String> statesLga = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomNunitoText(
            text: "Delivery & Returns",
            fontWeight: FontWeight.w600,
            textSize: 14,
          ),
          CustomNunitoText(
            text: "Choose Location",
            fontWeight: FontWeight.w600,
            textSize: 12,
            textColor: AppTheme.grey.shade300,
          ),
          const YMargin(14),
          DropdownButtonFormField<String>(
            key: const ValueKey('States'),
            value: _selectedState,
            hint: Text('Select State',
                style: AppTheme.textSmMedium.copyWith(color: Colors.grey)),
            onChanged: (String? newValue) {
              setState(() {
                _selectedState = newValue;
                lgaValue = 'Select Location';
                statesLga.clear();
                statesLga.add(lgaValue);
                statesLga.addAll(NigerianStatesAndLGA.getStateLGAs(newValue!));
                setState(() {
                  stateValue = newValue;
                });
              });
            },
            items: NigerianStatesAndLGA.allStates
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            itemHeight: 48.0,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              // Adjust padding to reduce height
              border: const OutlineInputBorder(),
              focusColor: AppTheme.grey.shade300,
            ),
          ),
          const YMargin(20),
          DropdownButtonFormField<String>(
            key: const ValueKey('Local governments'),
            value: lgaValue,
            hint: Text('Select Location',
                style: AppTheme.textSmMedium.copyWith(color: Colors.grey)),
            onChanged: (String? newValue) {
              setState(() {
                lgaValue = newValue!;
              });
            },
            items: statesLga.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            itemHeight: 48.0,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
              // Adjust padding to reduce height
              border: const OutlineInputBorder(),
              focusColor: AppTheme.grey.shade300,
            ),
          ),
          const YMargin(34),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppSvgAssets.pickup),
              const XMargin(6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomNunitoText(
                          text: "Pickup Station",
                          fontWeight: FontWeight.w500,
                          textSize: 14,
                        ),
                        GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => const DeliveryDetailsDialog(
                              details:
                                  'Delivery time starts from the day you place your order to the day one of our associates makes a first attempt to deliver to you. Delivery will be attempted 2 times over 5 days (7:00am to 5:30pm) after which the item will be cancelled, if you are unreachable or unable to receive the order.',
                              amount: 'N 1,110',
                            ),
                          ),
                          child: const CustomNunitoText(
                            text: "Details",
                            fontWeight: FontWeight.w400,
                            textSize: 12,
                            textColor: AppTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const CustomNunitoText(
                      text:
                          "Delivery Fees N1,000\nArriving at pickup station between 11 June & 13 June when you order within next 20hrs 40mins",
                      fontWeight: FontWeight.w400,
                      textSize: 12,
                      maxline: 4,
                    ),
                  ],
                ),
              )
            ],
          ),
          const YMargin(28),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppSvgAssets.door),
              const XMargin(6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomNunitoText(
                          text: "Door Delivery",
                          fontWeight: FontWeight.w500,
                          textSize: 14,
                        ),
                        GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => const DeliveryDetailsDialog(
                              details:
                                  'Delivery time starts from the day you place your order to the day your order arrives at the pickup station. You will be notified of your order’s arrival, and you have to retrieve it within 5 days. If the order is not picked up, it will be automatically cancelled.',
                              amount: 'N 660',
                            ),
                          ),
                          child: const CustomNunitoText(
                            text: "Details",
                            fontWeight: FontWeight.w400,
                            textSize: 12,
                            textColor: AppTheme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const CustomNunitoText(
                      text:
                          "Delivery Fees N1,000\nArriving at pickup station between 11 June & 13 June when you order within next 20hrs 40mins",
                      fontWeight: FontWeight.w400,
                      textSize: 12,
                      maxline: 4,
                    ),
                  ],
                ),
              )
            ],
          ),
          const YMargin(10),
          const Divider(),
          const YMargin(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppSvgAssets.returnPolicy),
              const XMargin(6),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomNunitoText(
                          text: "Return policy",
                          fontWeight: FontWeight.w500,
                          textSize: 14,
                        ),
                      ],
                    ),
                    CustomNunitoText(
                      text: "Free return within 7 days for ALL eligible items",
                      fontWeight: FontWeight.w400,
                      textSize: 12,
                      maxline: 4,
                    ),
                  ],
                ),
              )
            ],
          ),
          const YMargin(10),
          const Divider(),
          const YMargin(10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppSvgAssets.warranty),
              const XMargin(6),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomNunitoText(
                          text: "Warranty",
                          fontWeight: FontWeight.w500,
                          textSize: 14,
                        ),
                      ],
                    ),
                    CustomNunitoText(
                      text: "One Year Warranty",
                      fontWeight: FontWeight.w400,
                      textSize: 12,
                      maxline: 4,
                    ),
                  ],
                ),
              )
            ],
          ),
          const YMargin(34),
          const CustomNunitoText(
            text: "Any Questions about this products?",
            fontWeight: FontWeight.w400,
            textSize: 12,
            alignText: TextAlign.center,
          ),
          const YMargin(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppSvgAssets.chat),
              const XMargin(3),
              const CustomNunitoText(
                text: "Chat now",
                fontWeight: FontWeight.w600,
                textSize: 14,
                alignText: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}
