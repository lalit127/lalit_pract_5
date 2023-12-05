import 'dart:io';
import 'package:lalit_pract_5/model/resume_model.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfHelper {
  static Future<File> generateCenteredtext(ResumeModel? resumeModel) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => pw.Center(
                child: pw.Column(children: [
              pw.Text("${resumeModel!.userName}",
                  style: TextStyle(fontSize: 48)),
              pw.Text("${resumeModel.phoneNumber}",
                  style: TextStyle(fontSize: 48)),
              pw.Text("${resumeModel.skillsList}",
                  style: TextStyle(fontSize: 48)),
              pw.Text("${resumeModel.socialLinksList}",
                  style: TextStyle(fontSize: 48)),
              pw.Text("${resumeModel.experienceList}",
                  style: TextStyle(fontSize: 48)),
            ]))));
    print(resumeModel!.userName);
    return saveDocument(name: 'sample.pdf', pdf: pdf);
  }

  static Future<File> saveDocument(
      {required String name, required Document pdf}) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    final pdfBytes = await pdf.save();
    await file.writeAsBytes(pdfBytes.toList());
    print('-----------------------------> pdf created');
    print("--------------------------->${file.path}");

    File filepath = File(file.path);
    if (await filepath.exists()) {
      print('File exists!');
    } else {
      print('File does not exist.');
    }

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
