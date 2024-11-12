import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tezda_interview/utils/app_theme.dart';

import 'custom_text.dart';

class CustomInputText extends StatelessWidget {
  const CustomInputText({
    super.key,
    required this.label,
    this.controller,
    this.placeholder,
    this.counterText,
    this.maxLength,
    this.maxLines,
    this.letterSpacing,
    required this.keyboardType,
    required this.inputAction,
    this.validate,
    this.enabled,
    this.obscureText = false,
    this.readOnly = false,
    this.required = false,
    this.labelColor,
    this.borderColor,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.sentences,
    this.suffixIcon,
    this.prefixIcon,
    this.onKeyUp,
  });

  final String label;
  final TextEditingController? controller;
  final String? placeholder;
  final String? counterText;
  final int? maxLength;
  final int? maxLines;
  final double? letterSpacing;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final FormFieldValidator<String>? validate;
  final bool? enabled;
  final bool obscureText;
  final bool readOnly;
  final bool required;
  final Color? labelColor;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onKeyUp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: TextFormField(
        onChanged: onKeyUp,
        controller: controller,
        validator: validate,
        textInputAction: inputAction,
        keyboardType: keyboardType,
        maxLength: maxLength,
        maxLines: maxLines,
        style: TextStyle(
          letterSpacing: letterSpacing,
        ),
        decoration: InputDecoration(
            fillColor: Colors.white,
            counter: const SizedBox.shrink(),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: borderColor ?? AppTheme.grey[500]!, width: .1),
                borderRadius: BorderRadius.circular(10)),
            hintText: placeholder,
            prefixIcon: prefixIcon,
            counterText: counterText,
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            // border: InputBorder.none,
            suffixIcon: suffixIcon,
            suffixIconConstraints: const BoxConstraints(
                maxHeight: 30, maxWidth: 35, minHeight: 20)),
        readOnly: readOnly,
        enabled: enabled,
        cursorColor: AppTheme.primaryColor,
        inputFormatters: inputFormatters,
        textCapitalization: textCapitalization,
        obscureText: obscureText,
      ),
    );
  }
}

class CustomLabelInputText extends StatelessWidget {
  const CustomLabelInputText({
    super.key,
    required this.label,
    this.controller,
    this.placeholder,
    this.counterText,
    this.maxLength,
    this.maxLines,
    required this.keyboardType,
    required this.inputAction,
    this.validate,
    this.enabled,
    this.obscureText = false,
    this.readOnly = false,
    this.labelColor,
    this.borderColor,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.sentences,
    this.suffixIcon,
    this.prefixIcon,
    this.onKeyUp,
  });

  final String label;
  final TextEditingController? controller;
  final String? placeholder;
  final String? counterText;
  final int? maxLength;
  final int? maxLines;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final FormFieldValidator<String>? validate;
  final bool? enabled;
  final bool obscureText;
  final bool readOnly;
  final Color? labelColor;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onKeyUp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomNunitoText(
          text: label,
          textColor: labelColor ?? Colors.black,
          textSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 4,
        ),
        TextFormField(
          onChanged: onKeyUp,
          controller: controller,
          validator: validate,
          textInputAction: inputAction,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          decoration: InputDecoration(
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 13.0,
                horizontal: 10.0,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(3)),
              hintText: placeholder,
              prefixIcon: prefixIcon,
              counterText: counterText,
              hintStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              // border: InputBorder.none,
              suffixIcon: suffixIcon,
              suffixIconConstraints: const BoxConstraints(
                  maxHeight: 30, maxWidth: 35, minHeight: 20)),
          readOnly: readOnly,
          enabled: enabled,
          cursorColor: AppTheme.primaryColor,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          obscureText: obscureText,
        ),
      ],
    );
  }
}

class CustomLabelUnderlineInputText extends StatelessWidget {
  const CustomLabelUnderlineInputText({
    super.key,
    required this.label,
    required this.controller,
    this.placeholder,
    this.maxLength,
    required this.keyboardType,
    required this.inputAction,
    this.validate,
    this.enabled,
    this.obscureText = false,
    this.readOnly = false,
    this.labelColor,
    this.borderColor,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.sentences,
    this.suffixIcon,
    this.prefixIcon,
    this.onKeyUp,
    this.onEditingComplete,
  });

  final String label;
  final TextEditingController controller;
  final String? placeholder;
  final int? maxLength;
  final TextInputType keyboardType;
  final TextInputAction inputAction;
  final FormFieldValidator<String>? validate;
  final bool? enabled;
  final bool obscureText;
  final bool readOnly;
  final Color? labelColor;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(String)? onKeyUp;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: CustomNunitoText(
            text: label,
            textColor: labelColor ?? Colors.black,
            textSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: 45,
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
          decoration: BoxDecoration(
            // color: Colors.grey.shade100,
            border: Border.all(color: borderColor ?? Colors.grey),
            borderRadius: const BorderRadius.all(Radius.circular(3)),
          ),
          child: TextFormField(
            onChanged: onKeyUp,
            onEditingComplete: onEditingComplete,
            controller: controller,
            validator: validate,
            textInputAction: inputAction,
            keyboardType: keyboardType,
            maxLength: maxLength,
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
                fillColor: Colors.grey,
                contentPadding: const EdgeInsets.only(bottom: 11),
                hintText: placeholder,
                prefixIcon: prefixIcon,
                hintStyle: const TextStyle(fontSize: 14),
                // border: InputBorder.none,
                suffixIcon: suffixIcon,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIconConstraints: const BoxConstraints(
                    maxHeight: 30, maxWidth: 24, minHeight: 20)),
            readOnly: readOnly,
            enabled: enabled,
            cursorColor: AppTheme.primaryColor,
            inputFormatters: inputFormatters,
            textCapitalization: textCapitalization,
            obscureText: obscureText,
          ),
        ),
      ],
    );
  }
}
