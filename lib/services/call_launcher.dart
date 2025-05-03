import 'package:url_launcher/url_launcher.dart';

void launchCall(String phoneNumber, Function(String) onError) async {
  final uri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    onError('Could not launch call');
  }
}
