import 'package:flutter/material.dart';
import 'package:lalit_pract_5/utils/constants.dart';

class CommonText extends StatelessWidget {

  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? underLine;
  final TextStyle? style;


  const CommonText(
      {this.text,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.underLine,this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: style??TextStyle(
        fontFamily: 'Inter',
        decoration: underLine ?? TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? 16,
        color: color ?? AppColor.black,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
