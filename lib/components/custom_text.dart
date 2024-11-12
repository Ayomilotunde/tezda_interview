import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tezda_interview/constants/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? textSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? alignText;
  final TextOverflow? overflow;
  final bool? softwrap;

  const CustomText({
    super.key,
    required this.text,
    this.textSize,
    this.fontWeight,
    this.textColor,
    this.alignText,
    this.overflow,
    this.softwrap,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor,
      ),
      textAlign: alignText,
      overflow: overflow,
      softWrap: softwrap,
    );
  }
}

class CustomNunitoText extends StatelessWidget {
  final String? text;
  final double? textSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? alignText;
  final TextOverflow? overflow;
  final bool? softwrap;
  final bool? isMoney;
  final TextDecoration? decoration;
  final int? maxline;

  const CustomNunitoText({
    super.key,
    required this.text,
    this.textSize,
    this.fontWeight,
    this.textColor,
    this.alignText,
    this.overflow,
    this.softwrap,
    this.isMoney,
    this.decoration,
    this.maxline,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      isMoney == null || isMoney == false
          ? text ?? ''
          : "$currency${text?.replaceAllMapped(reg, mathFunc) ?? ''}",
      style: GoogleFonts.workSans(
          textStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor,
        decoration: decoration,
      )),
      maxLines: maxline,
      textAlign: alignText,
      overflow: overflow,
      softWrap: softwrap,
    );
  }
}

class CustomPlayFiarText extends StatelessWidget {
  final String text;
  final double? textSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? alignText;
  final TextOverflow? overflow;
  final bool? softwrap;

  const CustomPlayFiarText({
    super.key,
    required this.text,
    this.textSize,
    this.fontWeight,
    this.textColor,
    this.alignText,
    this.overflow,
    this.softwrap,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.playfairDisplay(
          textStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor,
      )),
      textAlign: alignText,
      overflow: overflow,
      softWrap: softwrap,
    );
  }
}

class CustomLatoText extends StatelessWidget {
  final String text;
  final double? textSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? alignText;
  final TextOverflow? overflow;
  final bool? softwrap;

  const CustomLatoText({
    super.key,
    required this.text,
    this.textSize,
    this.fontWeight,
    this.textColor,
    this.alignText,
    this.overflow,
    this.softwrap,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          textStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor,
      )),
      textAlign: alignText,
      overflow: overflow,
      softWrap: softwrap,
    );
  }
}

class CustomInterText extends StatelessWidget {
  final String text;
  final double? textSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? alignText;
  final TextOverflow? overflow;
  final bool? softwrap;

  const CustomInterText({
    super.key,
    required this.text,
    this.textSize,
    this.fontWeight,
    this.textColor,
    this.alignText,
    this.overflow,
    this.softwrap,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: textSize,
        fontWeight: fontWeight,
        color: textColor,
      )),
      textAlign: alignText,
      overflow: overflow,
      softWrap: softwrap,
    );
  }
}
