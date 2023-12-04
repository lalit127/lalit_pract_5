import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalit_pract_5/controller/resume_controller.dart';
import 'package:lalit_pract_5/utils/constants.dart';
import 'package:lalit_pract_5/widget/common_text.dart';

class TagItem extends StatefulWidget {
  final int index;
  void Function()? onPressed;
  String? text;


  TagItem({Key? key, required this.index,this.onPressed,this.text}) : super(key: key);

  @override
  State<TagItem> createState() => _TagItemState();
}

class _TagItemState extends State<TagItem> {
  final resumeCon = Get.find<ResumeController>();

  Widget buildTagItem() {
    return CommonText(
      text:widget.text,
      fontSize: 20,
      color: AppColor.white,
      fontWeight: FontWeight.w700,
      textAlign: TextAlign.center,
    );
  }

  @override
  void initState() {
    super.initState();
    buildTagItem();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTagItem(),
            IconButton(
                onPressed: widget.onPressed,
                icon: Icon(
                  Icons.cancel,
                  color: AppColor.white,
                ))
          ],
        ));
  }
}
