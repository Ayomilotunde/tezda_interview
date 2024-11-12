import 'package:tezda_interview/components/custom_label_text_form_field.dart';
import 'package:flutter/material.dart';

class EditProfileItem extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onKeyUp;
  final bool? obscureText;
  final bool? disabled;
  final bool? enabled;

  const EditProfileItem(
      {super.key,
      required this.title,
      required this.hintText,
      this.obscureText,
      this.disabled,
      this.controller,
      this.onKeyUp,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // disabled == null
        //     ? Text(
        //         title,
        //         style: const TextStyle(
        //             fontWeight: FontWeight.w600,
        //             fontSize: 12,
        //             color: Color(0xff1E1E1E)),
        //       )
        //     : const SizedBox(),
        const SizedBox(height: 10),
        SizedBox(
            // height: 40,
            child: CustomLabelInputText(
          label: title,
          placeholder: hintText,
          readOnly: disabled ?? true,
          enabled: enabled,
          keyboardType: TextInputType.text,
          inputAction: TextInputAction.next,
          controller: controller ?? TextEditingController(),
          onKeyUp: onKeyUp,
        )

            // TextFormField(
            //   obscureText: obscureText ?? false,
            //   controller: controller ?? TextEditingController(),
            //   decoration: InputDecoration(
            //     hintText: hintText,
            //     disabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //             color: disabled != null
            //                 ? const Color(0xffC4C4C4)
            //                 : Colors.transparent)),
            //     enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide(
            //             color: disabled != null
            //                 ? const Color(0xffC4C4C4)
            //                 : Colors.transparent)),
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: const BorderSide(color: Color(0xff90C326)),
            //     ),
            //   ),
            // ),
            ),
        const SizedBox(height: 20),
      ],
    );
  }
}
