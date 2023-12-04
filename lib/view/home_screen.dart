import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalit_pract_5/controller/home_controller.dart';
import 'package:lalit_pract_5/utils/constants.dart';
import 'package:lalit_pract_5/view/resume_screen.dart';
import 'package:lalit_pract_5/widget/common_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeCon = Get.put<HomeController>(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeCon.getAllResumeData();
  }

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
      body: Obx(
        () => GridView.builder(
          itemCount: homeCon.resumeList.value.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(
                  () => Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () => homeCon.deleteResume(
                              homeCon.resumeList.value[index]?.id),
                          icon: Icon(
                            Icons.delete,
                            size: 40,
                            color: AppColor.red,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CommonText(
                          text: "${homeCon.resumeList.value[index].userName}",
                          color: AppColor.black,
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: IconButton(
                              onPressed: () => homeCon.fetchResumeById(
                                  homeCon.resumeList.value[index]!.id),
                              icon: Icon(
                                Icons.edit,
                                size: 40,
                              ))),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
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
        child: const Icon(
          Icons.add,
          color: AppColor.white,
        ),
      ),
    );
  }
}
