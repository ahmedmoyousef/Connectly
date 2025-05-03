import 'package:url_launcher/url_launcher.dart';

void launchTelegram(String phoneNumber, Function(String) onError) async {
  final uri = Uri.parse('https://t.me/$phoneNumber');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    onError('Could not launch Telegram');
  }
}
