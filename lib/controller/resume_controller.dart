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

  Rx<TextEditingController> skillTag = TextEditingController().obs;
  Rx<TextEditingController> socialTag = TextEditingController().obs;
  Rx<TextEditingController> phoneNumber = TextEditingController().obs;
  Rx<TextEditingController> userName = TextEditingController().obs;
  RxList skillList = [].obs;
  Rx<TextEditingController> experienceTag = TextEditingController().obs;
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
    if (skillTag.value.text.isNotEmpty) {
      skillList.add(skillTag.value.text);
      print(skillList);
      skillTag.value.clear();
    }
  }

  addSocialLinks() {
    if (socialTag.value.text.isNotEmpty) {
      socialTagList.add(socialTag.value.text);
      print(socialTagList);
      socialTag.value.clear();
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
    if (experienceTag.value.text.isNotEmpty) {
      experienceList.add(experienceTag.value.text);
      print(experienceList);
      experienceTag.value.clear();
    }
  }

  removeExperience(int index) {
    if (index >= 0 && index < experienceList.value.length) {
      experienceList.value.removeAt(index);
    }
  }

  saveResumeData() async {
    if (selectedPath.value.isEmpty) {
      Get.snackbar("Error", "Please Choose Image");
    } else {
      try {
        Map<String, dynamic> resumeData = {
          'userName': userName.value.text,
          'phoneNumber': phoneNumber.value.text,
          'socialLinksList': socialTagList.value.join(','),
          'skillsList': skillList.value.join(','),
          'experienceList': experienceList.value.join(','),
        };
        var resume = ResumeModel.fromJson(resumeData);

        DatabaseHelper dbHelper = DatabaseHelper();
        await dbHelper.initializeDatabase();

        await dbHelper.insertResume(resume);
        Get.snackbar("Success", "Data Save Successfully");
        final pdfFile = await PdfHelper.generatePdf(resume);
        PdfHelper.openFile(pdfFile,resume);
        print("------------------->File Opened");
      } catch (e) {
        print('Error saving resume data: $e');
      }
    }
  }

  updateResumeData(int? id) async {
      try {
        print("${userName.value.text}");
        Map<String, dynamic> resumeData = {
          'id':id,
          'userName': userName.value.text,
          'phoneNumber': phoneNumber.value.text,
          'socialLinksList': socialTagList.value.join(','),
          'skillsList': skillList.value.join(','),
          'experienceList': experienceList.value.join(','),
        };

        var resume = ResumeModel.fromJson(resumeData);
        print(resume);
        DatabaseHelper dbHelper = DatabaseHelper();
        await dbHelper.initializeDatabase();

        await dbHelper.updateResume(resume);
        Get.snackbar("Success", "Data update Successfully");
        final pdfFile = await
        PdfHelper.generatePdf(resume);
        PdfHelper.openFile(pdfFile,resume);
        print("------------------->File Opened");
      } catch (e) {
        print('Error saving resume data: $e');
    }
  }
}