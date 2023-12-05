import 'package:get/get.dart';
import 'package:lalit_pract_5/database/database_helper.dart';
import 'package:lalit_pract_5/model/resume_model.dart';
import 'package:lalit_pract_5/view/resume_screen.dart';

class HomeController extends GetxController{

  RxList<ResumeModel> resumeList = <ResumeModel>[].obs;
  DatabaseHelper dbHelper = DatabaseHelper();

  getAllResumeData() async {
    try {
      DatabaseHelper dbHelper = DatabaseHelper();
      await dbHelper.initializeDatabase();
      List<Map<String, dynamic>> result = await dbHelper.getAllResumes();
      resumeList.value = result.map((resumeData) => ResumeModel.fromJson(resumeData)).toList();
    } catch (e) {
      print('Error getting all resume data: $e');
    }
  }
  deleteResume(int? id) async {
    try {
      await dbHelper.deleteResume(id!);
      print('Resume data deleted successfully!');
      getAllResumeData();
    } catch (e) {
      print('Error deleting resume data: $e');
    }
  }

  fetchResumeById(int? id) async {
    try {
      DatabaseHelper dbHelper = DatabaseHelper();
      await dbHelper.initializeDatabase();
      Map<String, dynamic> resumeData = await dbHelper.getResumeById(id!);
     Get.to(ResumeScreen(resumeData: ResumeModel.fromJson(resumeData),));
      print("Fetched Resume Data: $resumeData");
    } catch (e) {
      print('Error fetching resume data: $e');
    }
  }
}