import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lalit_pract_5/database/database_helper.dart';
import 'package:lalit_pract_5/database/pdf_helper.dart';
import 'package:lalit_pract_5/model/resume_model.dart';

class ResumeController extends GetxController {
  RxString selectedPath = "".obs;
  final profileImage = Rx<File?>(null);
  late Uint8List uint8List;

  TextEditingController skillTag = TextEditingController();
  TextEditingController socialTag = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController userName = TextEditingController();
  RxList skillList = [].obs;
  TextEditingController experienceTag = TextEditingController();
  RxList experienceList = [].obs;
  RxList socialTagList = [].obs;

  pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
        uint8List = await profileImage.value!.readAsBytes();
        selectedPath.value = profileImage.value!.path;
      } else {
        Get.snackbar("Erorr", "Something error");
      }
    } catch (e) {
      print(e);
    }
  }

  addSkillTag() {
    if (skillTag.text.isNotEmpty) {
      skillList.add(skillTag.text);
      print(skillList);
      skillTag.clear();
    }
  }

  addSocialLinks() {
    if (socialTag.text.isNotEmpty) {
      socialTagList.add(socialTag.text);
      print(socialTagList);
      socialTag.clear();
    }
  }

  removeSkills(int index) {
    if (index >= 0 && index < skillList.length) {
      skillList.removeAt(index);
    }
  }

  removeSocial(int index) {
    if (index >= 0 && index < socialTagList.length) {
      socialTagList.removeAt(index);
    }
  }

  addExperience() {
    if (experienceTag.text.isNotEmpty) {
      experienceList.add(experienceTag.text);
      print(experienceList);
      experienceTag.clear();
    }
  }

  removeExperience(int index) {
    if (index >= 0 && index < experienceList.length) {
      experienceList.removeAt(index);
    }
  }

  saveResumeData() async {
    if (profileImage.value!.path.isEmpty) {
      Get.snackbar("Error", "Please Choose Image");
    } else {
      try {
        Map<String, dynamic> resumeData = {
          'userName': userName.text,
          'phoneNumber': phoneNumber.text,
          'socialLinksList': socialTagList.join(','),
          'skillsList': skillList.join(','),
          'experienceList': experienceList.join(','),
          'profilePicture': uint8List,
        };
        var resume = ResumeModel.fromJson(resumeData);

        DatabaseHelper dbHelper = DatabaseHelper();
        await dbHelper.initializeDatabase();

        await dbHelper.insertResume(resume);
        Get.snackbar("Success", "Data Save Successfully");
        final pdfFile = await
        PdfHelper.generateCenteredtext(resume);
        PdfHelper.openFile(pdfFile);
        print("------------------->File Opened");
      } catch (e) {
        print('Error saving resume data: $e');
      }
    }
  }

  updateResumeData() async {
      try {
        Map<String, dynamic> resumeData = {
          'userName': userName.text,
          'phoneNumber': phoneNumber.text,
          'socialLinksList': socialTagList.join(','),
          'skillsList': skillList.join(','),
          'experienceList': experienceList.join(','),
          'profilePicture': experienceList.join(','),
        };
        var resume = ResumeModel.fromJson(resumeData);

        DatabaseHelper dbHelper = DatabaseHelper();
        await dbHelper.initializeDatabase();

        await dbHelper.updateResume(resume);
        Get.snackbar("Success", "Data update Successfully");
        final pdfFile = await
        PdfHelper.generateCenteredtext(resume);
        PdfHelper.openFile(pdfFile);
        print("------------------->File Opened");
      } catch (e) {
        print('Error saving resume data: $e');
    }
  }
}