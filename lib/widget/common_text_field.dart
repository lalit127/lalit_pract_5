import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lalit_pract_5/utils/constants.dart';

class CommonTextField extends StatelessWidget {

  TextEditingController? controller = TextEditingController();
  Color? borderColor;
  Color? labelColor;
  bool? obscureText;
  String? hintText;
  double? hintTextSize;
  double? radius;
  FontWeight? fontWeight;
  bool? labelView;
  TextAlign? textAlign;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  int? maxLines;
  bool? showLabelView;
  Color? fillColor;
  int? maxLength;
  void Function(String)? onChanged;


  CommonTextField(
      {this.controller,
      this.borderColor,
      this.labelColor,
      this.obscureText,
      this.hintText,
      this.hintTextSize,
      this.radius,
      this.fontWeight,
      this.labelView,
      this.textAlign,
      this.keyboardType,
      this.inputFormatters,
      this.maxLines,
      this.showLabelView,
      this.fillColor,
      this.maxLength,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.start,
      cursorColor: AppColor.primary,
      obscureText: obscureText ?? false,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.newline,
      maxLines: maxLines ?? 1,
      style: GoogleFonts.fredoka(fontWeight: FontWeight.w500, fontSize: 16, color: AppColor.black),
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        fillColor: fillColor ?? AppColor.white,
        labelText: labelView ?? false ? null : hintText,
        labelStyle: GoogleFonts.fredoka(
            fontSize: hintTextSize ?? 14,
            color: labelColor ?? AppColor.border,
            fontWeight: fontWeight ?? FontWeight.w500),
        hintText: hintText??"",
        floatingLabelStyle: const TextStyle(color: AppColor.primary),
        hintStyle: GoogleFonts.fredoka(
            fontSize: hintTextSize ?? 16, color: AppColor.border, fontWeight: fontWeight ?? FontWeight.w500),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          borderSide: BorderSide(color: AppColor.border),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          borderSide: const BorderSide(color: AppColor.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          borderSide: const BorderSide(color: AppColor.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
          borderSide: BorderSide(color: borderColor ?? AppColor.border),
        ),
      ),
    );
  }
}
