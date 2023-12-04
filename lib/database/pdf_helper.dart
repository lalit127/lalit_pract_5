import 'dart:io';
import 'package:lalit_pract_5/model/resume_model.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfHelper {
  static Future<File> generateCenteredtext(ResumeModel? resumeModel) async {
    final pdf = Document();

    pdf.addPage(Page(
        build: (context) =>
            Center(child: Row(
              children: [
                Text("${resumeModel!.userName}", style: TextStyle(fontSize: 48)),
                Text("${resumeModel.phoneNumber}", style: TextStyle(fontSize: 48)),
                Text("${resumeModel.skillsList}", style: TextStyle(fontSize: 48)),
                Text("${resumeModel.socialLinksList}", style: TextStyle(fontSize: 48)),
                Text("${resumeModel.experienceList}", style: TextStyle(fontSize: 48)),
              ]
            )
                )));
    print(resumeModel!.userName);
    return saveDocument(name: 'sample.pdf', pdf: pdf);
  }

  static Future<File> saveDocument(
      {required String name, required Document pdf}) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);

    print('-----------------------------> pdf created');

    return file;
  }

  static Future openFile(File file) async{
    final url  = file.path;
    await OpenFile.open(url);
  }
}