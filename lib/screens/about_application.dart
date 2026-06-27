import 'package:flutter/material.dart';

class AboutApplication extends StatelessWidget {
  static const String routeName = '/about_application';
  const AboutApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Application')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Connectly Application',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Connectly is a user-friendly mobile application designed to simplify communication. With Connectly, you can easily perform the following actions with a phone number:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '- 📞 Make a phone call\n- 💬 Send an SMS\n- 🟢 Open a WhatsApp chat\n- 🔵 Open a Telegram chat',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'The app ensures a seamless experience with real-time phone number validation and intuitive navigation.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
