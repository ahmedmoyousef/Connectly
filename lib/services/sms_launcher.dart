import 'package:url_launcher/url_launcher.dart';

void launchSMS(String phoneNumber, Function(String) onError) async {
  final uri = Uri(scheme: 'sms', path: phoneNumber);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    onError('Could not launch SMS');
  }
}
