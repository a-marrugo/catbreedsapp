import 'package:url_launcher/url_launcher.dart';

/// Opens a URL in the external browser/app.
/// Returns true if successful, false otherwise.
Future<bool> openUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
    return true;
  }
  return false;
}
