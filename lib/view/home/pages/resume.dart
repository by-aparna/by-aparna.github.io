import 'package:aparna_chatterjee/res/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;

class Resume extends StatefulWidget {
  Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  final AssetBundle rootBundle = PlatformAssetBundle();

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }

  Future<String> showCV() async {
    var bytes = await rootBundle.load(FilePath.pdfAssetPath + 'aparna_chatterjee.pdf'); // location of your asset file
    final blob = html.Blob([bytes], 'application/pdf');
    final url = html.Url.createObjectUrlFromBlob(blob);
    return url;
  }
}
