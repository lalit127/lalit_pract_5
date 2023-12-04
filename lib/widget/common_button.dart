import 'package:flutter/material.dart';
import 'package:lalit_pract_5/utils/constants.dart';
import 'package:lalit_pract_5/widget/common_text.dart';

class CommonButton extends StatefulWidget {
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
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.all(widget.containerPadding ?? 0),
        height: widget.height ?? 52,
        decoration: BoxDecoration(
          color: widget.color ?? AppColor.primary,
          borderRadius: BorderRadius.circular(widget.radius ?? 10),
          border: Border.all(
              color: widget.borderColor ?? Colors.transparent,
              width: widget.borderWidth ?? 1),
        ),
        child: Center(
            child: CommonText(
                text: widget.text ?? "",
                color: widget.textColor ?? AppColor.white,
                fontWeight: widget.fontWeight ?? FontWeight.w500,
                fontSize: widget.fontSize ?? 16)),
      ),
    );
  }
}
