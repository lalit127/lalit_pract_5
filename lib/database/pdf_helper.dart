import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class PdfHelper {
  static Future<File> generateCenteredtext(String text) async {
    final pdf = Document();

    pdf.addPage(Page(
        build: (context) =>
            Center(child: Text(text, style: TextStyle(fontSize: 48)))));

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