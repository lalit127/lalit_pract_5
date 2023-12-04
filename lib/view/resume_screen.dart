import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalit_pract_5/controller/home_controller.dart';
import 'package:lalit_pract_5/controller/resume_controller.dart';
import 'package:lalit_pract_5/model/resume_model.dart';
import 'package:lalit_pract_5/utils/constants.dart';
import 'package:lalit_pract_5/widget/common_button.dart';
import 'package:lalit_pract_5/widget/common_tag.dart';
import 'package:lalit_pract_5/widget/common_text.dart';
import 'package:lalit_pract_5/widget/common_text_field.dart';

class ResumeScreen extends StatefulWidget {
  ResumeModel? resumeData;
  ResumeScreen({Key? key, this.resumeData}) : super(key: key);

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  final resumeCon = Get.put<ResumeController>(ResumeController());
  final homeCon = Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: CommonText(
          text: (widget.resumeData != null) ? "Update Resume" : "Create Resume",
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        leading: InkWell(
          onTap: () {
            homeCon.getAllResumeData();
            Get.back();
          },
          child: const Icon(Icons.close),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                Obx(
                  () => Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: resumeCon.selectedPath.isNotEmpty
                          ? FileImage(resumeCon.profileImage.value!)
                          : NetworkImage('https://picsum.photos/id/237/200/300') as ImageProvider<Object>?,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () => resumeCon.pickImage(),
                    child: Icon(Icons.photo_camera_outlined,
                        color: Colors.white.withOpacity(0.7)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CommonTextField(
              hintText: "Enter Full Name",
              controller: (widget.resumeData != null)
                  ? TextEditingController(text: widget.resumeData?.userName)
                  : resumeCon.userName,
            ),
            const SizedBox(height: 20),
            CommonTextField(
              hintText: "Enter Phone Number",
              keyboardType: TextInputType.number,
              controller: (widget.resumeData != null)
                  ? TextEditingController(text: widget.resumeData?.phoneNumber)
                  : resumeCon.phoneNumber,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    controller: resumeCon.skillTag,
                    hintText: "Add 5 Skills",
                    suffix: IconButton(
                      color: AppColor.primary,
                      onPressed: () => resumeCon.addSkillTag(),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Obx(
              () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  resumeCon.skillList.length,
                  (index) => TagItem(
                    index: index,
                    onPressed: () => resumeCon.removeSkills(index),
                    text: resumeCon.skillList.value[index],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    controller: resumeCon.socialTag,
                    hintText: "Add Social Links",
                    suffix: IconButton(
                      color: AppColor.primary,
                      onPressed: () => resumeCon.addSocialLinks(),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Obx(
              () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  resumeCon.socialTagList.length,
                  (index) => TagItem(
                    index: index,
                    onPressed: () => resumeCon.removeSocial(index),
                    text: resumeCon.socialTagList.value[index],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    controller: resumeCon.experienceTag,
                    hintText: "Add Experience",
                    suffix: IconButton(
                      color: AppColor.primary,
                      onPressed: () => resumeCon.addExperience(),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Obx(
              () => Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: List.generate(
                  resumeCon.experienceList.length,
                  (index) => TagItem(
                    index: index,
                    onPressed: () => resumeCon.removeExperience(index),
                    text: resumeCon.experienceList.value[index],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            CommonButton(
              onPressed: () {
                if (resumeCon.userName.text.isNotEmpty &&
                    resumeCon.phoneNumber.text.isNotEmpty) {
                  (widget.resumeData?.userName != null)
                      ? resumeCon.updateResumeData()
                      : resumeCon.saveResumeData();
                }
              },
              text: "Create",
              fontSize: 18,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
}
