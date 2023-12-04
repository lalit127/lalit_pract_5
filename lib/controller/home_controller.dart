import 'package:get/get.dart';
import 'package:lalit_pract_5/database/database_helper.dart';

class HomeController extends GetxController{

  RxList resumeList = [].obs;

 getAllResumeData() async {
    try {
      DatabaseHelper dbHelper = DatabaseHelper();
      await dbHelper.initializeDatabase();
      resumeList = (await dbHelper.getAllResumes()) as RxList;

      print('All Resume Data: $resumeList');
    } catch (e) {
      print('Error getting all resume data: $e');
    }
  }
}