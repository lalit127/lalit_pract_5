import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lalit_pract_5/database/database_helper.dart';
import 'package:lalit_pract_5/model/resume_model.dart';

class ResumeController extends GetxController{

  RxString selectedPath = "".obs;
  final profileImage = Rx<File?>(null);

  TextEditingController skillTag = TextEditingController();
  TextEditingController socialTag = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController userName = TextEditingController();
  RxList skillList = [].obs;
  TextEditingController experienceTag = TextEditingController();
  RxList experienceList = [].obs;
  RxList socialTagList = [].obs;

  pickImage() async {
    try{
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
        selectedPath.value = profileImage.value!.path;
      } else {
        Get.snackbar("Erorr", "Something error");
      }
    }catch(e){
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
    try {

      Map<String, dynamic> resumeData = {
        'userName': userName.text,
        'phoneNumber': phoneNumber.text,
        'socialLinksList': socialTagList.join(','),
        'skillsList': skillList.join(','),
        'experienceList': experienceList.join(','),
      };
      var resume = ResumeModel.fromJson(resumeData);

      DatabaseHelper dbHelper = DatabaseHelper();
      await dbHelper.initializeDatabase();

      await dbHelper.insertResume(resume);
      Get.snackbar("Success", "Data Save Successfully");
    } catch (e) {
      print('Error saving resume data: $e');
    }
  }



}