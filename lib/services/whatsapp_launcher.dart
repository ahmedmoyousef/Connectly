import 'package:url_launcher/url_launcher.dart';

Future<void> launchWhatsApp(
  String phoneNumber,
  String message,
  Function(String) showToast,
) async {
  final formattedNumber = phoneNumber.replaceAll('+', '');
  final url =
      'https://wa.me/$formattedNumber?text=${Uri.encodeComponent(message)}';
  final uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    showToast('Could not open WhatsApp');
  }
}
