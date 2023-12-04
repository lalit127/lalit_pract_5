import 'package:flutter/material.dart';
import 'package:lalit_pract_5/utils/constants.dart';
import 'package:lalit_pract_5/widget/common_text.dart';

class CommonButton extends StatelessWidget {
  String? text;
  double? radius;
  Color? borderColor;
  Color? color;
  Color? textColor;
  VoidCallback? onPressed;
  double? borderWidth;
  double? fontSize;
  FontWeight? fontWeight;
  bool? load;
  double? height;
  String? prefixIcon;
  String? suffixIcon;
  Color? iconBorderColor;
  double? iconPadding;
  double? containerPadding;

  CommonButton(
      {super.key,
      this.text,
      this.radius,
      this.borderColor,
      this.color,
      this.onPressed,
      this.textColor,
      this.borderWidth,
      this.fontSize,
      this.fontWeight,
      this.load,
      this.height,
      this.prefixIcon,
      this.suffixIcon,
      this.iconBorderColor,
      this.containerPadding,
      this.iconPadding});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(containerPadding ?? 0),
        height: height ?? 52,
        decoration: BoxDecoration(
          color: color ?? AppColor.primary,
          borderRadius: BorderRadius.circular(radius ?? 10),
          border: Border.all(
              color: borderColor ?? Colors.transparent,
              width: borderWidth ?? 1),
        ),
        child: Center(
            child: CommonText(
                text: text ?? "",
                color: textColor ?? AppColor.white,
                fontWeight: fontWeight ?? FontWeight.w500,
                fontSize: fontSize ?? 16)),
      ),
    );
  }
}
