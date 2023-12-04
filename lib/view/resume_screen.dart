import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lalit_pract_5/controller/resume_controller.dart';
import 'package:lalit_pract_5/utils/constants.dart';
import 'package:lalit_pract_5/widget/common_button.dart';
import 'package:lalit_pract_5/widget/common_tag.dart';
import 'package:lalit_pract_5/widget/common_text.dart';
import 'package:lalit_pract_5/widget/common_text_field.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({Key? key}) : super(key: key);

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  final resumeCon = Get.put<ResumeController>(ResumeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const CommonText(
          text: "Create Resume",
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        leading: InkWell(
          onTap: () => Get.back(),
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
                Obx(() =>
                   Align(
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
              controller: resumeCon.userName,
            ),
            const SizedBox(height: 20),
            CommonTextField(
              hintText: "Enter Phone Number",
              controller: resumeCon.phoneNumber,
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
            const SizedBox(height: 10),
            Obx(
              () => SizedBox(
                height: resumeCon.skillList.isNotEmpty ? 70 : 0,
                child: Wrap(
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
            ),
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
              () => SizedBox(
                height: resumeCon.socialTagList.isNotEmpty ? 70 : 0,
                child: Wrap(
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
            ),
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
              () => SizedBox(
                height: resumeCon.experienceList.isNotEmpty ? 70 : 0,
                child: Wrap(
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
            ),
            CommonButton(
              onPressed: () => resumeCon.saveResumeData(),
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
