import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

launchURL({required String url}) async {
  if (await canLaunchUrlString(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
