

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalit_pract_5/database/pdf_helper.dart';
import 'package:lalit_pract_5/widget/common_button.dart';
import 'package:lalit_pract_5/widget/common_text.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const CommonText(
          text: "Select Template",
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.edit,size: 30,),
        ),
      ),
      body: Column(
        children: [
          CommonButton(text: "Create",onPressed: () async{
            final pdfFile = await
            PdfHelper.generateCenteredtext('Sample Text');
            PdfHelper.openFile(pdfFile);
          },),
        ],
      ),
    );
  }
}
