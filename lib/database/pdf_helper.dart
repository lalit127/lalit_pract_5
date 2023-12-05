import 'dart:io';
import 'dart:typed_data';
import 'package:lalit_pract_5/model/resume_model.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as pw;

class PdfHelper {

  static Future<Uint8List> generatePdf(ResumeModel? resumeModel) async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
              child: pw.Column(children: [
                pw.Text("${resumeModel!.userName}",
                    style: TextStyle(fontSize: 48)),
                pw.Text("${resumeModel.phoneNumber}",
                    style: TextStyle(fontSize: 48)),
              ]));// Center
        }));

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/${resumeModel!.userName}.pdf");
    await file.writeAsBytes(await pdf.save());
    return pdf.save();
  }


  static Future openFile(Uint8List fileBytes,ResumeModel? resumeModel) async {
    try {
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/${resumeModel!.userName}.pdf');
      await tempFile.writeAsBytes(fileBytes);
      await OpenFile.open(tempFile.path);
    } catch (e) {
      print('Error opening file: $e');
    }
  }
}
