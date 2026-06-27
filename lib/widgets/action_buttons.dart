import 'package:connectly/models/valid_phone_number.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/call_launcher.dart';
import '../services/sms_launcher.dart';
import '../services/whatsapp_launcher.dart';
import '../services/telegram_launcher.dart';

class ActionButtons extends StatelessWidget {
  final ValidPhoneNumber? phoneNumber;
  bool get isEnabled => phoneNumber != null;
  const ActionButtons({super.key, required this.phoneNumber});

  void _showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed:
              isEnabled
                  ? () => launchCall(phoneNumber!.international, _showToast)
                  : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            fixedSize: const Size.fromHeight(50),
          ),
          icon: const Icon(Icons.phone, color: Colors.white, size: 22),
          label: const Text('Call', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed:
              isEnabled
                  ? () => launchSMS(phoneNumber!.international, _showToast)
                  : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            fixedSize: const Size.fromHeight(50),
          ),
          icon: const Icon(Icons.message, color: Colors.white, size: 22),
          label: const Text('SMS', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed:
              isEnabled
                  ? () async {
                    launchWhatsApp(phoneNumber!.international, '', _showToast);
                  }
                  : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            fixedSize: const Size.fromHeight(50),
          ),
          icon: const Icon(Icons.send, color: Colors.white, size: 22),
          label: const Text('WhatsApp', style: TextStyle(color: Colors.white)),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed:
              isEnabled
                  ? () => launchTelegram(phoneNumber!.international, _showToast)
                  : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            fixedSize: const Size.fromHeight(50),
          ),
          icon: const Icon(Icons.telegram, color: Colors.white, size: 22),
          label: const Text('Telegram', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
