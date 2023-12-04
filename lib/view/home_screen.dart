import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalit_pract_5/controller/home_controller.dart';
import 'package:lalit_pract_5/utils/constants.dart';
import 'package:lalit_pract_5/view/resume_screen.dart';
import 'package:lalit_pract_5/widget/common_text.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final homeCon = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        title: const CommonText(
          text: "Resume Builder App",
          fontWeight: FontWeight.w700,
          color: AppColor.white,
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 4,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          index = index + 1;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: CommonText(
                  text: "Resume $index",
                  color: AppColor.black,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(
            ResumeScreen(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 300),
          );
        },
        backgroundColor: AppColor.primary,
        child: const Icon(Icons.add,color: AppColor.white,),

      ),
    );
  }
}
